//
//  ViewController.swift
//  ChuckNorrisFacts
//
//  Created by Rodrigo Ryo Aoki on 28/06/21.
//

import UIKit

//MARK: - Instances
class HomeViewController: UIViewController {
	
	var container = ContainerHelper().getHomeViewControllerContainer()
	
	lazy var homeView = container.resolve(HomeView.self, argument: self.view.bounds)!
	lazy var searchBtn = container.resolve(UIBarButtonItem.self, name: UIBarButtonItemOptions.search.rawValue)!
	lazy var titleItem = container.resolve(UIBarButtonItem.self, name: UIBarButtonItemOptions.title.rawValue)!
	

//MARK: - Override Funcs
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view = homeView
		
		configureNavigationBar()
		setCollectionDataSourceDelegateAndRegister()
		
		homeView.collectionView.contentMode = .scaleAspectFill
	}
}

//MARK: - Collection View Configuration
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		return UICollectionViewCell()
	}
}

//MARK: - Funcs
extension HomeViewController {
	func setCollectionDataSourceDelegateAndRegister() {
//		homeView.collectionView.register(, forCellWithReuseIdentifier: )
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

	}
}

