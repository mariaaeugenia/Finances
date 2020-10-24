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
}

class ItemModel {
    
    var id: String
    var name: String
    var value: String
    var address: String
    
    init(id: String, name: String?, value: String?, address: String?) {
        self.id = id
        self.name = name ?? "-"
        self.value = value ?? "R$0"
        self.address = address ?? ""
    }
}
