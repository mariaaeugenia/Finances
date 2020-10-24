//
//  NewItemViewModel.swift
//  Finances
//
//  Created by Maria Eugênia Pereira Teixeira on 24/10/20.
//

import UIKit
import CoreData


class NewItemViewModel {
    
    var presenter: NewItemPresentable?
    var item: ItemModel?
    
    init(with item: ItemModel? = nil) {
        self.item = item
    }
    
    func loadData() {
        guard let item = item else { return }
        presenter?.load(item: item)
    }
    
    func save(name: String?, value: String?, address: String?) {
        guard item == nil else {
            update(name: name, value: value, address: address)
            return
        }
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        guard let itemEntity = NSEntityDescription.entity(forEntityName: "Item", in: managedContext) else { return }
        let item = NSManagedObject(entity: itemEntity, insertInto: managedContext)
        let id = UUID.init().uuidString
        item.setValue(id, forKey: ItemEntity.id.rawValue)
        item.setValue(name, forKeyPath: ItemEntity.name.rawValue)
        item.setValue(value, forKey: ItemEntity.value.rawValue)
        item.setValue(address, forKey: ItemEntity.address.rawValue)
        do {
            try managedContext.save()
            presenter?.showAlert(with: "Alerta", and: "Salvo com sucesso!")
        } catch let error as NSError {
            presenter?.showAlert(with: "Erro", and: error.localizedDescription)
        }
    }
    
    private func update(name: String?, value: String?, address: String?) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate, let id = item?.id, !id.isEmpty else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Item")
        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            guard let objectUpdate = result.first as? NSManagedObject else { return }
            objectUpdate.setValue(name, forKey: ItemEntity.name.rawValue)
            objectUpdate.setValue(value, forKey: ItemEntity.value.rawValue)
            objectUpdate.setValue(address, forKey: ItemEntity.address.rawValue)
            do {
                try managedContext.save()
                presenter?.showAlert(with: "Sucesso", and: "Item editado sucesso!")
            }
            catch let error as NSError {
                presenter?.showAlert(with: "Erro", and: error.localizedDescription)
            }
        }
        catch let error as NSError {
            presenter?.showAlert(with: "Erro", and: error.localizedDescription)
        }
    }
}
