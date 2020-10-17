//
//  UIApplication+Extensions.swift
//  Finances
//
//  Created by Maria Eugênia Pereira Teixeira on 17/10/20.
//

import UIKit

extension UIApplication {
    static var appVersion: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
    }
}
