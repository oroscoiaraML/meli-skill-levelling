//
//  SearchViewModel.swift
//  skill-levelling
//
//  Created by Iara Denise Orosco on 18/09/2022.
//

import UIKit
import Alamofire
import Foundation

protocol SearchViewModelDelegate: AnyObject {
    func reloadData()
    func showError(error: String)
}

class SearchViewModel {
    
    var delegate: SearchViewModelDelegate!
    
    init(delegate: SearchViewModelDelegate) {
        self.delegate = delegate
    }
    
    func loadData(query: String, handler: @escaping ([ResultOverview]) -> Void) {
        let api = SearchAPI.shared
        var searchResults = [ResultOverview]()
        api.getToken(onError: {
            print("Token erróneo")
        }, onSuccess: {
            api.getCategories(query: query,
                              onError: { error in
                print("Error categorias: \(error)")
                self.delegate.reloadData()
            }, onSuccess: { categories in
                api.getProducts(category: categories[0].categoryID,
                                onError: { error in
                    print("Error items: \(error)")
                    self.delegate.showError(error: "No hay items")
                }, onSuccess: { products in
                    let products = products.content
                    for resultNumber in 0..<products.count {
                        api.getProductsDetails(product: products[resultNumber]) { error in
                            print(error)
                            if resultNumber == products.count-1 {
                                handler(searchResults)
                            }
                        } onSuccess: { result in
                            searchResults.append(result)
                            if  resultNumber == products.count-1 {
                                handler(searchResults)
                            }
                        }
                    }
                })
            })
        })
    }
}
