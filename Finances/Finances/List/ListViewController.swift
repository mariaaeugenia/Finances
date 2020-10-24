//
//  ListViewController.swift
//  Finances
//
//  Created by Maria Eugênia Pereira Teixeira on 17/10/20.
//

import Foundation
import UIKit

class ListViewController: TableViewController {
    
    var vm: ListViewModel!
    
    override init() {
        vm = .init()
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        vm.loadData()
    }
    
    override func configureViews() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped(_ :)))
        vm.registerCell(for: tableView)
        vm.presenter = self
    }
    
    @objc private func addButtonTapped(_ sender: UIBarButtonItem) {
        
    }

    //MARK: - TABLE VIEW DELEGATE & DATA SOURCE
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        vm.heighForRow
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        vm.cellForRow(tableView: tableView, at: indexPath)
    }
    
}

extension ListViewController: ListViewPresentable {
    func reloadData() {
        tableView.reloadData()
    }
}
