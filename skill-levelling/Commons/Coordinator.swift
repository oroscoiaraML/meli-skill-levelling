//
//  Coordinator.swift
//  skill-levelling
//
//  Created by Iara Denise Orosco on 18/09/2022.
//


import UIKit

protocol Coordinator {
    func start()
    var navigation: UINavigationController { get }
}
