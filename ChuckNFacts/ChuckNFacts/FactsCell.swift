//
//  FactsCell.swift
//  ChuckNorrisFacts
//
//  Created by Rodrigo Ryo Aoki on 28/06/21.
//

import UIKit

//MARK: - Instances
class FactsCell: UICollectionViewCell {
	static var reuseIdentifier: String = "FactsCell"
	
	var container = ContainerHelper().getFactViewCellContainer()
	
	lazy var factView = container.resolve(FactView.self)!
	
	private var shareBtnCallBack: (() -> Void)? = {}
	
//MARK: - Init
	 override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = .systemRed
		setUpView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

//MARK: - Cell Configuration
extension FactsCell {
	func configure(text: String, categories: [String], fontSize: CGFloat, shareBtnAction: @escaping () -> ()) {
		factView.title.text = text
		factView.title.font = UIFont.boldSystemFont(ofSize: fontSize)
		
		factView.removeAllCategories()
		
		for category in categories {
			factView.addCategory(text: category)
		}
		
		shareBtnCallBack = shareBtnAction
		
		factView.shareBtn.addTarget(self, action: #selector(shareAction), for: .touchUpInside)
	}
	
	@objc private func shareAction() {
		print("funfou")
		shareBtnCallBack?()
	}
}

extension FactsCell: ComponentView {
	func setUpHierarchy() {
		addSubview(factView)
	}
	
	func setUpConstraints() {
		NSLayoutConstraint.activate([
			factView.topAnchor.constraint(equalTo: self.topAnchor),
			factView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			factView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			factView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
		])
	}
	
	func setUpAdditional() {
		
	}
}
