//
//  SearchView.swift
//  ChuckNorrisFacts
//
//  Created by Rodrigo Ryo Aoki on 28/06/21.
//

import UIKit

//MARK: - Instances
class SearchView: UIView {

	var container = ContainerHelper().getSearchViewContainer()
	
	lazy var textField = container.resolve(SearchTextField.self)!
	lazy var loading = container.resolve(UIActivityIndicatorView.self)!
	lazy var feedbackLabel = container.resolve(UILabel.self)!
    
//MARK: - Inits
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setUpView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}


//MARK: - Component View
extension SearchView: ComponentView {
	func setUpHierarchy() {
		self.addSubview(textField)
		self.addSubview(loading)
		self.addSubview(feedbackLabel)
	}
	
	func setUpConstraints() {
		NSLayoutConstraint.activate([
			textField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 18),
			textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
			textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
			
			loading.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			loading.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			
			feedbackLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			feedbackLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			feedbackLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			feedbackLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
		])
	}
	
	func setUpAdditional() {
		
	}
}
