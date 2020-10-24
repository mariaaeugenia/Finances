//
//  ListCellViewModel.swift
//  Finances
//
//  Created by Maria Eugênia Pereira Teixeira on 24/10/20.
//

import Foundation


class ListCellViewModel {
    
    var name: String
    var value: String
    var address: String
    
    init(name: String?, value: String?, address: String?) {
        self.name = name ?? "-"
        self.value = value ?? "R$0"
        self.address = address ?? ""
    }
}
