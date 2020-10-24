//
//  ListViewModel.swift
//  Finances
//
//  Created by Maria Eugênia Pereira Teixeira on 24/10/20.
//

import UIKit
import CoreData


class ListViewModel {
    
    var presenter: ListViewPresentable?
    
    var data: [ItemModel]
    
    var numberOfRows: Int {
        data.count
    }
    
    var heighForRow: CGFloat {
        UITableView.automaticDimension
    }
    
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
                if let id = data.value(forKey: ItemEntity.id.rawValue) as? String, !id.isEmpty {
                    let name = data.value(forKey: ItemEntity.name.rawValue) as? String
                    let value = data.value(forKey: ItemEntity.value.rawValue) as? String
                    let address = data.value(forKey: ItemEntity.address.rawValue) as? String
                    let vm = ItemModel(id: id, name: name, value: value, address: address)
                    self.data.append(vm)
                }
            }
            presenter?.reloadData()
        }
        catch {
            print("Failed")
        }
    }
    
    func registerCell(for tableView: UITableView) {
        tableView.register(ListCell.self, forCellReuseIdentifier: "CELL")
    }
    
    func cellForRow(tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as? ListCell else { return UITableViewCell() }
        let item = data[indexPath.row]
        cell.set(item: item)
        return cell
    }
    
    func didSelect(at index: IndexPath) -> ItemModel {
        data[index.row]
    }
}
