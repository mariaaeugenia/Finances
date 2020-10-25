//
//  String+Extension.swift
//  Finances
//
//  Created by Maria Eugênia Pereira Teixeira on 24/10/20.
//

import Foundation

extension String {
    func getDoubleValue() -> Double {
        let value = self.replacingOccurrences(of: ",", with: ".")
        if let double = Double(value) {
            return double
        }
        return 0
    }
}
