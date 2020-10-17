//
//  UIStackView+Extensions.swift
//  Finances
//
//  Created by Maria Eugênia Pereira Teixeira on 17/10/20.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { view in
            self.addArrangedSubview(view)
        }
    }
}
