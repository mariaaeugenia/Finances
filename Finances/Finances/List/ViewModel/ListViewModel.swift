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
    
    var data: [ListCellViewModel]
    
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
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        do {
            guard let result = try managedContext.fetch(fetchRequest) as? [NSManagedObject] else { return }
            for data in result  {
                let name = data.value(forKey: "name") as? String
                let value = data.value(forKey: "value") as? String
                let address = data.value(forKey: "address") as? String
                let vm = ListCellViewModel(name: name, value: value, address: address)
                self.data.append(vm)
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
        let vm = data[indexPath.row]
        cell.set(vm: vm)
        return cell
    }
}
