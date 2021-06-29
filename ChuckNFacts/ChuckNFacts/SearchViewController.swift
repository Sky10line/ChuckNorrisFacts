//
//  SearchViewController.swift
//  ChuckNorrisFacts
//
//  Created by Rodrigo Ryo Aoki on 28/06/21.
//

import UIKit

//MARK: - Instances
class SearchViewController: UIViewController {

	var container = ContainerHelper().getSearchViewControllerContainer()
	
	lazy var searchView = container.resolve(SearchView.self, argument: self.view.bounds)!
	
//MARK: - Override Funcs
	init() {
		super.init(nibName: nil, bundle: nil)
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
		
	}

//MARK: - Text Field Btn
	@objc private func textFieldBtnAction() {

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
