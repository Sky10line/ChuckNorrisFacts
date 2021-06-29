//
//  SearchViewController.swift
//  ChuckNorrisFacts
//
//  Created by Rodrigo Ryo Aoki on 28/06/21.
//

import UIKit

//MARK: - Instances
class SearchViewController: UIViewController {

	var parentController: HomeViewControllerSearchAccess!
	var container = ContainerHelper().getSearchViewControllerContainer()
	var request = RequestHelper()
	
	lazy var searchView = container.resolve(SearchView.self, argument: self.view.bounds)!
	
//MARK: - Override Funcs
	init(parentController: HomeViewControllerSearchAccess) {
		super.init(nibName: nil, bundle: nil)
		self.parentController = parentController
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view = searchView
		
		setBtnsActions()
	}
}

//MARK: - Set Btn Actions
extension SearchViewController {
	func setBtnsActions() {
		searchView.textField.doneBtn.addTarget(self, action: #selector(textFieldBtnAction), for: .touchUpInside)
	}

//MARK: - Text Field Btn
	@objc private func textFieldBtnAction() {
		startLoading()
		
		let text = searchView.textField.textField.text ?? ""
		
		request.createSearchRequest(text: text) { [self] (result) in
			switch result {
				case.success(let searchResult) :
					if let res = searchResult.result {
						if res.count > 0 {
							successRequest(search: searchResult)
						} else {
							failureRequest(text: "0 Results")
						}
						
					} else {
						let text = searchResult.violations!["search.query"]
						let formatedText = text!.prefix(1).uppercased() + text!.lowercased().dropFirst()
						failureRequest(text: formatedText)
					}
					
				case.failure(let error) :
					failureRequest(text: error.errorDescription ?? "Unrecognized Error")
			}
		}
	}
	
	private func successRequest(search: chuckSearch) {
		parentController.loadSearch(search: search.result!)
		searchView.feedbackLabel.text = "\(search.total!) Results"
		stopLoading()
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			self.navigationController?.popViewController(animated: true)
		}
	}
	
	private func failureRequest(text: String) {
		searchView.feedbackLabel.text = text
		
		stopLoading()
	}
	
	private func startLoading() {
		searchView.feedbackLabel.isHidden = true
		searchView.loading.startAnimating()
	}
	
	private func stopLoading() {
		searchView.loading.stopAnimating()
		searchView.feedbackLabel.isHidden = false
	}
}
