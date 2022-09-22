//
//  ProductCoordinator.swift
//  skill-levelling
//
//  Created by Iara Denise Orosco on 18/09/2022.
//

import UIKit

class ProductCoordinator: Coordinator {
    var navigation: UINavigationController
    var product: ResultOverview
    
    init(navigationController: UINavigationController, product: ResultOverview) {
        navigation = navigationController
        self.product = product
    }
    
    func start() {
        let productVC = ProductViewController()
        navigation.pushViewController(productVC, animated: true)
        productVC.product = self.product
    }
}
