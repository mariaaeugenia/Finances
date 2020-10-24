//
//  NewItemPresentable.swift
//  Finances
//
//  Created by Maria Eugênia Pereira Teixeira on 24/10/20.
//

import Foundation

protocol NewItemPresentable {
    func load(item: ItemModel)
    func showAlert(with title: String, and message: String)
}
