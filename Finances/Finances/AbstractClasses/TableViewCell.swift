//
//  TableViewCell.swift
//  Finances
//
//  Created by Maria Eugênia Pereira Teixeira on 16/10/20.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell, ViewControllerDelegate {
    
    init() {
        super.init(style: .default, reuseIdentifier: nil)
        setup()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareViews() {}
    func addViewHierarchy() {}
    func setupConstraints() {}
    func configureViews() {}
}
