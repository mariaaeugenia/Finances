//
//  ViewControllerDelegate.swift
//  Finances
//
//  Created by Maria Eugênia Pereira Teixeira on 16/10/20.
//

import Foundation

protocol ViewControllerDelegate: class {
    func setup()
    func prepareViews()
    func addViewHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewControllerDelegate {
    func setup() {
        prepareViews()
        addViewHierarchy()
        setupConstraints()
        configureViews()
    }
}
