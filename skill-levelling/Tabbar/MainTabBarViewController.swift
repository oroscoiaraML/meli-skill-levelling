//
//  MainTabBarViewController.swift
//  skill-levelling
//
//  Created by Iara Denise Orosco on 20/09/2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
    }
    
    private func setUpTabBar(){
        tabBar.backgroundColor = .white
        tabBar.tintColor = .lightGray
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .white
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        
        let configuration = UIImage.SymbolConfiguration(paletteColors: [.systemBlue])
        
        let searchVC = SearchViewController()
        let item1 = UINavigationController(rootViewController: searchVC)
        searchVC.tabBarItem = UITabBarItem(title: "Inicio", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill", withConfiguration: configuration))
        
        let favsVC = FavoritesTableViewController()
        let item2 = UINavigationController(rootViewController: favsVC)
        favsVC.tabBarItem = UITabBarItem(title: "Favoritos", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill", withConfiguration: configuration))
        
        let myPurchasesVC = SearchViewController()
        let item3 = UINavigationController(rootViewController: myPurchasesVC)
        myPurchasesVC.tabBarItem = UITabBarItem(title: "Mis Compras", image: UIImage(systemName:"bag"), selectedImage: UIImage(systemName: "bag.fill", withConfiguration: configuration))
        
        let notificationsVC = SearchViewController()
        let item4 = UINavigationController(rootViewController: notificationsVC)
        notificationsVC.tabBarItem = UITabBarItem(title: "Notificaciones", image: UIImage(systemName: "bell"), selectedImage: UIImage(systemName: "bell.fill", withConfiguration: configuration))
        
        let moreOptionsVC = SearchViewController()
        let item5 = UINavigationController(rootViewController: moreOptionsVC)
        moreOptionsVC.tabBarItem = UITabBarItem(title: "Más", image: UIImage(systemName: "line.3.horizontal.circle"), selectedImage: UIImage(systemName: "line.3.horizontal.circle.fill", withConfiguration: configuration))
        
        setViewControllers ([item1, item2, item3, item4, item5], animated: true)
    }
    
}


