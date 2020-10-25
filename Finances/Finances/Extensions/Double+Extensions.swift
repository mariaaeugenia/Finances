//
//  Double+Extensions.swift
//  Finances
//
//  Created by Maria Eugênia Pereira Teixeira on 24/10/20.
//

import Foundation

extension Double {
    
    func getDollarCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en")
        formatter.currencyCode = "USD"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .currency
        let number = NSNumber(value: self)
        if let str = formatter.string(from: number) {
            return str
        }
        return "\(self)"
    }
    
    func getRealCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt")
        formatter.currencyCode = "BRL"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .currency
        let number = NSNumber(value: self)
        if let str = formatter.string(from: number) {
            return str
        }
        return "\(self)"
    }
}
