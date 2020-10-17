//
//  ViewController.swift
//  Finances
//
//  Created by Maria Eugênia Pereira Teixeira on 16/10/20.
//

import UIKit
import SnapKit

class ViewController: UIViewController, ViewControllerDelegate {

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
    
    //MARK: -
    //MARK: - VIEWCONTROLLER DELEGATE
    func prepareViews() {}
    func addViewHierarchy() {}
    func setupConstraints() {}
    func configureViews() {}
}
