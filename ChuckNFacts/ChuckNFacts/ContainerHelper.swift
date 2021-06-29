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
	
	func getSearchViewContainer() -> Container {
		let container = Container()
		
		container.register(SearchTextField.self) { (_) in
			let view = SearchTextField()
			
			view.translatesAutoresizingMaskIntoConstraints = false
			return view
		}
		
		container.register(UIActivityIndicatorView.self) { (_) in
			let view = UIActivityIndicatorView(style: .large)
			
			view.hidesWhenStopped = true
			view.stopAnimating()
			
			view.translatesAutoresizingMaskIntoConstraints = false
			return view
		}
		
		container.register(UILabel.self) { (_) in
			let lb = UILabel()
			
			lb.textAlignment = .center
			lb.textColor = .black
			lb.lineBreakMode = .byWordWrapping
			lb.numberOfLines = 0
			
			lb.translatesAutoresizingMaskIntoConstraints = false
			return lb
		}
		
		return container
	}
	
	func getSearchViewControllerContainer() -> Container {
		let container = Container()
		
		container.register(SearchView.self) { (_, frame: CGRect) in
			let view = SearchView(frame: frame)
			
			view.backgroundColor = .white
			
			return view
		}
		
		return container
	}
	
	func getSearchTextFieldContainer() -> Container {
		let container = Container()
		
		container.register(UITextField.self) { (_) in
			let view = UITextField()
			
			view.translatesAutoresizingMaskIntoConstraints = false
			
			return view
		}
		
		container.register(UIButton.self) { (_) in
			let btn = UIButton(type: .system)
			btn.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
			btn.translatesAutoresizingMaskIntoConstraints = false
			
			return btn
		}
		
		return container
	}
	
	func getFactViewContainer() -> Container {
		let container = Container()
		
		container.register(UILabel.self) { (_) in
			let lb = UILabel()
			
			lb.textColor = .black
			lb.lineBreakMode = .byWordWrapping
			lb.numberOfLines = 0
			lb.textAlignment = .left
			
			lb.translatesAutoresizingMaskIntoConstraints = false
			return lb
		}
		
		container.register(CategoryLabel.self) { (_) in
			let lb = CategoryLabel(withPadding: 0, 0, 15, 15)
			
			lb.textAlignment = .center
			lb.textColor = .white
			lb.font = .boldSystemFont(ofSize: 15)
			lb.backgroundColor = .systemBlue
			lb.translatesAutoresizingMaskIntoConstraints = false
			
			return lb
		}
		
		container.register(UIButton.self) { (_) in
			let btn = UIButton(type: .system)
			btn.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
			btn.tintColor = .black
			btn.translatesAutoresizingMaskIntoConstraints = false
			return btn
		}
		
		container.register(UIStackView.self) { (_) in
			let stack = UIStackView()
			stack.axis = .horizontal
			stack.distribution = .fillEqually
			stack.spacing = 10
			stack.translatesAutoresizingMaskIntoConstraints = false
			return stack
		}
		
		return container
	}
	
	func getFactViewCellContainer() -> Container {
		let container = Container()
		
		container.register(FactView.self) { (_) in
			let view = FactView()
			
			view.translatesAutoresizingMaskIntoConstraints = false
			return view
		}
		
		return container
	}
}
