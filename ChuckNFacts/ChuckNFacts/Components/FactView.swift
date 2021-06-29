//
//  FactView.swift
//  ThirdPartyLibrariesTest
//
//  Created by Rodrigo Ryo Aoki on 21/06/21.
//

import UIKit
import Swinject

class FactView: UIView {
	
	let container = ContainerHelper().getFactViewContainer()
	
	lazy var title = container.resolve(UILabel.self)!
	lazy var categories = container.resolve(UIStackView.self)!
	lazy var shareBtn = container.resolve(UIButton.self)!
	
	init() {
		super.init(frame: .zero)
		setUpView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension FactView {
	func addCategory(text: String) {
		let label = container.resolve(CategoryLabel.self)!
	
		label.text = text.uppercased()
		
		categories.addArrangedSubview(label)
	}
	
	func removeAllCategories() {
		for view in categories.arrangedSubviews {
			view.removeFromSuperview()
		}
	}
}

extension FactView: ComponentView {
	func setUpHierarchy() {
		addSubview(title)
		addSubview(categories)
		addSubview(shareBtn)
	}
	
	func setUpConstraints() {
		NSLayoutConstraint.activate([
			title.topAnchor.constraint(equalTo: self.topAnchor, constant: 18),
			title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
			title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
			
			categories.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
			categories.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
			categories.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -18),
//
			shareBtn.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
			shareBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
			shareBtn.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -18)
		])
	}
	
	func setUpAdditional() {
		self.layer.borderWidth = 1
		self.layer.borderColor = UIColor.gray.cgColor
		self.backgroundColor = .systemGray6
	}
}
