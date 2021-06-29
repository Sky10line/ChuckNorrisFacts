//
//  CategoryLabel.swift
//  ChuckNorrisFacts
//
//  Created by Rodrigo Ryo Aoki on 28/06/21.
//

import UIKit

class CategoryLabel: UILabel {
	
	var topInset: CGFloat
	var bottomInset: CGFloat
	var leftInset: CGFloat
	var rightInset: CGFloat
	
	init(withPadding top: CGFloat, _ bottom: CGFloat, _ left: CGFloat, _ right: CGFloat) {
			self.topInset = top
			self.bottomInset = bottom
			self.leftInset = left
			self.rightInset = right
			super.init(frame: CGRect.zero)
		}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func drawText(in rect: CGRect) {
		let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
		super.drawText(in: rect.inset(by: insets))
	}
		
	override var intrinsicContentSize: CGSize {
		let size = super.intrinsicContentSize
		return CGSize(width: size.width + leftInset + rightInset,
						height: size.height + topInset + bottomInset)
	}

}
