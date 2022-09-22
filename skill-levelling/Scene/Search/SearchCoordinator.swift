//
//  SearchCoordinator.swift
//  skill-levelling
//
//  Created by Iara Denise Orosco on 18/09/2022.
//

import UIKit

class SearchCoordinator: Coordinator {
    var navigation: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigation = navigationController
    }
    
    func start() {
        let searchVC = SearchViewController()
        navigation.pushViewController(searchVC, animated: true)
    }
}
