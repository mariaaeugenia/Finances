//
//  MapViewModel.swift
//  Finances
//
//  Created by Maria Eugênia Pereira Teixeira on 24/10/20.
//

import UIKit
import CoreData


class MapViewModel {
    
    var presenter: MapPresentable?
    var data: [ItemModel]
    
    init() {
        data = []
    }
    
    func loadData() {
        getItems()
    }
    
    private func getItems() {
        data.removeAll()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        do {
            guard let result = try managedContext.fetch(fetchRequest) as? [NSManagedObject] else { return }
            for data in result  {
                
                if let address = data.value(forKey: ItemEntity.address.rawValue) as? String, !address.isEmpty {
                    let name = data.value(forKey: ItemEntity.name.rawValue) as? String
                    let item = ItemModel(id: "", name: name, value: 0.0, address: address, isDollar: false)
                    self.data.append(item)
                }
            }
            presenter?.load(data)
        }
        catch {
            print("Failed")
        }
    }
}
