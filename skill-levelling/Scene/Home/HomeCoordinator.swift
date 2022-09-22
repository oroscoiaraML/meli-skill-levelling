//
//  HomeCoordinator.swift
//  skill-levelling
//
//  Created by Iara Denise Orosco on 18/09/2022.
//

import UIKit

class HomeCoordinator: Coordinator {
    var navigation: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigation = navigationController
    
    }
    
    func start() {
        let homeVC = HomeViewController()
        self.navigation.pushViewController(homeVC, animated: true)
        
    }
}
