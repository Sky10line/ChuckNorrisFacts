//
//  ViewController.swift
//  ChuckNorrisFacts
//
//  Created by Rodrigo Ryo Aoki on 28/06/21.
//

import UIKit

protocol HomeViewControllerSearchAccess {
	func loadSearch(search: [chuckResponse])
}

//MARK: - Instances
class HomeViewController: UIViewController {
	
	var container = ContainerHelper().getHomeViewControllerContainer()
	
	lazy var homeView = container.resolve(HomeView.self, argument: self.view.bounds)!
	lazy var searchBtn = container.resolve(UIBarButtonItem.self, name: UIBarButtonItemOptions.search.rawValue)!
	lazy var titleItem = container.resolve(UIBarButtonItem.self, name: UIBarButtonItemOptions.title.rawValue)!
	
	var facts: [chuckResponse] = []

//MARK: - Override Funcs
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view = homeView
		
//		facts.append(chuckResponse(categories: nil, value: "aaaaa \n aaaa \n aaaaa", created_at: "2", url: "bbb"))
		configureNavigationBar()
		setCollectionDataSourceDelegateAndRegister()
		
		homeView.collectionView.contentMode = .scaleAspectFill
	}
}

//MARK: - Collection View Configuration
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return facts.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FactsCell.reuseIdentifier, for: indexPath) as? FactsCell else {
			fatalError("Failed to Dequeue collection view")
		}
		
		let fact = facts[indexPath.item]
		
		let factCategories = checkCategories(categories: fact.categories!)
		
		let fontSize: CGFloat!
		
		if !isTitleBiggerThan80(text: fact.value) {
			fontSize = 30
		} else {
			fontSize = 20
		}
		
		cell.configure(text: fact.value, categories: factCategories, fontSize: fontSize) {
			let activity = UIActivityViewController(activityItems: [URL(string: fact.url)!], applicationActivities: nil)
			
			self.present(activity, animated: true, completion: nil)
		}
		
		return cell
	}
	
	func checkCategories(categories: [String]) -> [String] {
		let cat: [String]!
		
		if categories.count > 0 {
			cat = categories
		} else {
			cat = ["UNCATEGORIZED"]
		}
		
		return cat
	}
	
	func isTitleBiggerThan80(text: String) -> Bool {
		if text.count <= 80 {
			return false
		}
		return true
	}
}

//MARK: - Search Access
extension HomeViewController: HomeViewControllerSearchAccess {
	func loadSearch(search: [chuckResponse]) {
		facts.removeAll()
		facts = search
		//Make reload data
		homeView.collectionView.reloadData()
	}
}

//MARK: - Funcs
extension HomeViewController {
	func setCollectionDataSourceDelegateAndRegister() {
		homeView.collectionView.register(FactsCell.self, forCellWithReuseIdentifier: FactsCell.reuseIdentifier)
		homeView.collectionView.dataSource = self
		homeView.collectionView.delegate = self
	}
	
}

//MARK: - Navigation Bar Funcs
extension HomeViewController {
	private func configureNavigationBar() {
		self.navigationController!.navigationBar.barStyle = .black
		self.navigationController!.navigationBar.isTranslucent = true
		
		self.navigationItem.rightBarButtonItem = searchBtn
		self.navigationItem.leftBarButtonItem = titleItem
		
		searchBtn.target = self
		searchBtn.action = #selector(changeToSearchView)
	}
	
	@objc private func changeToSearchView() {
		let newView = SearchViewController(parentController: self)
		
		self.navigationController?.pushViewController(newView, animated: true)
	}
}

