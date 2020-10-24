//
//  TableViewController.swift
//  Finances
//
//  Created by Maria Eugênia Pereira Teixeira on 23/10/20.
//

import UIKit

class TableViewController: UITableViewController, ViewControllerDelegate {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .white
    }
    
    func prepareViews() {}
    func addViewHierarchy() {}
    func setupConstraints() {}
    func configureViews() {}
}
