//
//  ContainerHelper.swift
//  ChuckNorrisFacts
//
//  Created by Rodrigo Ryo Aoki on 28/06/21.
//

import Foundation
import UIKit
import Swinject

enum UIBarButtonItemOptions : String {
	case search
	case title
}

class ContainerHelper {
	func getHomeViewControllerContainer() -> Container {
		let container = Container()
		
		container.register(UIBarButtonItem.self, name: UIBarButtonItemOptions.search.rawValue) { (_) -> UIBarButtonItem in
			let btn = UIBarButtonItem(systemItem: .search)
			btn.tintColor = .white
			return btn
		}
		
		container.register(UILabel.self) { (_) in
			let lb = UILabel()
			lb.text = "CHUCK NORRIS FACTS"
			lb.textColor = .white
			lb.font = UIFont(name: "Arial", size: 20)
			return lb
		}
		
		container.register(UIBarButtonItem.self, name: UIBarButtonItemOptions.title.rawValue) { (resolve) in
			let label = resolve.resolve(UILabel.self)!
			let btn = UIBarButtonItem(customView: label)
			return btn
		}
		
		container.register(HomeView.self) { (_, frame: CGRect) in
			let view = HomeView(frame: frame)
			view.backgroundColor = .white
			return view
		}
		
		return container
	}
	
	func getHomeViewContainer() -> Container {
		let container = Container()
		
		container.register(UICollectionView.self) { (_, frame: CGRect) in
			let collection = UICollectionView(frame: frame, collectionViewLayout: UICollectionViewFlowLayout())
			
			
			let size = NSCollectionLayoutSize(
				widthDimension: NSCollectionLayoutDimension.fractionalWidth(1),
				heightDimension: NSCollectionLayoutDimension.estimated(100)
			)
			let item = NSCollectionLayoutItem(layoutSize: size)
			let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitem: item, count: 1)

			let section = NSCollectionLayoutSection(group: group)
			section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
			section.interGroupSpacing = 10

			let layout = UICollectionViewCompositionalLayout(section: section)
			collection.collectionViewLayout = layout
			
			
			collection.backgroundColor = .clear
			collection.translatesAutoresizingMaskIntoConstraints = false
			return collection
		}
		
		return container
	}
}
