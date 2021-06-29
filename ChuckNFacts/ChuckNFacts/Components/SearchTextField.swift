//
//  SearchTextField.swift
//  ChuckNorrisFacts
//
//  Created by Rodrigo Ryo Aoki on 22/06/21.
//

import UIKit

//MARK: - Instances
class SearchTextField: UIView {

	var container = ContainerHelper().getSearchTextFieldContainer()
	
	lazy var textField = container.resolve(UITextField.self)!
	lazy var doneBtn = container.resolve(UIButton.self)!
	
//MARK: - Inits
	init() {
		super.init(frame: .zero)
		self.layer.cornerRadius = 5
		self.layer.borderWidth = 1
		self.layer.borderColor = UIColor.gray.cgColor
		
		setUpView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}


//MARK: - Component View
extension SearchTextField: ComponentView {
	func setUpHierarchy() {
		addSubview(textField)
		addSubview(doneBtn)
	}
	
	func setUpConstraints() {
		NSLayoutConstraint.activate([
			textField.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
			textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
			textField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
			
			textField.trailingAnchor.constraint(equalTo: doneBtn.leadingAnchor, constant: -10),
			
			doneBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
			doneBtn.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -5),
			doneBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
			doneBtn.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75),
			doneBtn.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75)
		])
	}
	
	func setUpAdditional() {
		
	}
}
