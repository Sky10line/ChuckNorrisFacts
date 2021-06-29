//
//  HomeView.swift
//  ChuckNorrisFacts
//
//  Created by Rodrigo Ryo Aoki on 28/06/21.
//

import UIKit
import Swinject

//MARK: - Instances
class HomeView: UIView {
	
	let container = ContainerHelper().getHomeViewContainer()
	
	lazy var collectionView = container.resolve(UICollectionView.self, argument: self.bounds)!

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
extension HomeView: ComponentView {
	func setUpHierarchy() {
		addSubview(collectionView)
	}
	
	func setUpConstraints() {
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
			collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
		])
	}
	
	func setUpAdditional() {
		
	}
}
