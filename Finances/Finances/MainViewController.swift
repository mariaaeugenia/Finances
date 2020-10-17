//
//  MainViewController.swift
//  Finances
//
//  Created by Maria Eugênia Pereira Teixeira on 16/10/20.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        
        let listVC = UINavigationController(rootViewController: ListViewController())
        listVC.tabBarItem = UITabBarItem(title: "Lista", image: UIImage(systemName: "list.dash"), tag: 0)
        listVC.navigationController?.title = "Lista"
        
        let mapVC = MapViewController()
        mapVC.tabBarItem = UITabBarItem(title: "Mapa", image: UIImage(systemName: "map"), tag: 1)
        
        let settingsVC = SettingsViewController()
        settingsVC.tabBarItem = UITabBarItem(title: "Ajustes", image: UIImage(systemName: "gear"), tag: 2)
        
        let aboutVC = AboutViewController()
        aboutVC.tabBarItem = UITabBarItem(title: "Sobre", image: UIImage(systemName: "questionmark.circle"), tag: 3)
        
        self.viewControllers = [listVC, mapVC, settingsVC, aboutVC]
    }


}


