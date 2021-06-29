//
//  setUpView.swift
//  ChuckNorrisFacts
//
//  Created by Rodrigo Ryo Aoki on 28/06/21.
//

import Foundation


protocol ComponentView {
    func setUpView()
    func setUpHierarchy()
    func setUpConstraints()
    func setUpAdditional()
}

extension ComponentView {
    func setUpView() {
        setUpHierarchy()
        setUpConstraints()
        setUpAdditional()
    }
}
