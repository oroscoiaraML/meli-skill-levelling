//
//  HomeViewController.swift
//  skill-levelling
//
//  Created by Iara Denise Orosco on 18/09/2022.
//

import UIKit
import IQKeyboardManager

class HomeViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        self.navigationController?.isNavigationBarHidden = true
        if let token = UserDefaults.standard.object(forKey: "token") {
            UserDefaults.standard.removeObject(forKey: "token")
        }
    }
    
    func setupTabBar(animado isAnimated: Bool = true) {
        let tabVC = MainTabBarViewController()
        tabVC.modalTransitionStyle = .coverVertical
        tabVC.modalPresentationStyle = .fullScreen
        present(tabVC, animated: isAnimated)
    }
}
