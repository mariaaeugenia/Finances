//
//  ItemModel.swift
//  Finances
//
//  Created by Maria Eugênia Pereira Teixeira on 24/10/20.
//

import Foundation

enum ItemEntity: String {
    case id
    case name
    case value
    case address
    case isDollar
}

class ItemModel {
    
    var id: String
    var name: String
    var value: Double
    var address: String
    var isDollar: Bool
    
    var valueDollar: String {
        value.getDollarCurrency()
    }
    
    var valueReal: String {
        value.getRealCurrency()
    }
    
    init(id: String, name: String?, value: Double, address: String?, isDollar: Bool) {
        self.id = id
        self.name = name ?? "-"
        let dollarCurrency = Constants.Settings.dollarCurrency.getDoubleValue()
        self.value = isDollar ? value*dollarCurrency : value
        self.address = address ?? ""
        self.isDollar = isDollar
    }
}
