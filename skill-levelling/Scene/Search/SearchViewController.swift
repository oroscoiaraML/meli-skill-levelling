//
//  SearchViewController.swift
//  skill-levelling
//
//  Created by Iara Denise Orosco on 18/09/2022.
//

import UIKit
import Alamofire
import Foundation


class SearchViewController: UIViewController,SearchViewModelDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var resultsTable: UITableView!
    
    var searchResults = [ResultOverview]()
    var viewModel: SearchViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.viewModel = SearchViewModel(delegate: self)
        setupSearchBar()
        setupTable()
    }
    
    //cargar los resultado de la búsqueda
    func load(query: String) {
        self.searchResults.removeAll()
        self.resultsTable.reloadData()
        self.viewModel.loadData(query: query) { searchResults in
            self.searchResults = searchResults
            self.resultsTable.reloadData()
        }
    }
    
    func setupTable() {
        resultsTable.delegate = self
        resultsTable.dataSource = self
        resultsTable.rowHeight = 100
    }
    
    func setupSearchBar() {
        let textInSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textInSearchBar?.textColor = .gray
        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func reloadData() {
        self.resultsTable.reloadData()
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchResults = [ResultOverview]()
        load(query: searchBar.text!)
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentProduct = searchResults[indexPath.row]
        resultsTable.register(UINib(nibName: "ResultTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "resultCell")
        var cell = tableView.dequeueReusableCell(withIdentifier: "resultCell") as? ResultTableViewCell
        cell?.loadWithData(currentProduct)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = ProductCoordinator(navigationController: self.navigationController!, product: self.searchResults[indexPath.row])
        product.start()
    }
}

extension SearchViewController {
    func showError(error: String) {
        let alerta = UIAlertController(title: "No hay resultados para su búsqueda",
                                       message: nil,
                                       preferredStyle: .alert)
        
        let botonOk = UIAlertAction(title: "Aceptar",
                                    style: .default)
        
        
        alerta.addAction(botonOk)
        present(alerta, animated: true)
    }
}


