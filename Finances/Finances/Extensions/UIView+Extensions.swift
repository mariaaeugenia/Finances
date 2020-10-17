//
//  UIView+Extensions.swift
//  Finances
//
//  Created by Maria Eugênia Pereira Teixeira on 17/10/20.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { view in
            self.addSubview(view)
        }
    }
}
