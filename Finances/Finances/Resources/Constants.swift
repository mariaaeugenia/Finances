//
//  Constants.swift
//  Finances
//
//  Created by Maria Eugênia Pereira Teixeira on 17/10/20.
//

import Foundation

struct Constants {
    
    struct SettingsBundleKeys {
        static let Dollar_Currency = "DOLLAR_CURRENCY"
    }
    
    struct Settings {

        static var dollarCurrency: String {
            get {
                guard let dollarCurrency = UserDefaults.standard.string(forKey: SettingsBundleKeys.Dollar_Currency) else  {
                    UserDefaults.standard.set("5.5", forKey: SettingsBundleKeys.Dollar_Currency)
                    return "5.0"
                }
                return dollarCurrency
            }
        }
        
        static func updateDollarCurrency(with currency: String) {
            UserDefaults.standard.set(currency, forKey: SettingsBundleKeys.Dollar_Currency)
        }
        
    }
}
