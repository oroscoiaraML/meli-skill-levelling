//
//  FavoritesTableViewController.swift
//  skill-levelling
//
//  Created by Iara Denise Orosco on 21/09/2022.
//

import UIKit
import AndesUI

class FavoritesTableViewController: UITableViewController {
    
    let cellIdentifier = "favoriteCell"
    var searchResults = [ResultOverview]()
    
    @IBOutlet var resultsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clearsSelectionOnViewWillAppear = false
        title = "Mis Favoritos"
        assignbackground()
        
        let nib = UINib(nibName: "FavoriteTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        
        //registro un listener para cuando haya cambios
        FavoritesStorage.shared.addDataChanged {
            self.tableView.reloadData()
        }
    }
    //cargar los resultado de la búsqueda
    func load(query: String) {
        self.searchResults.removeAll()
        self.resultsTable.reloadData()
    }
    
    func assignbackground(){
        tableView.backgroundView = UIImageView(image: UIImage(named: "opaqueImageBackground"))
        navigationController?.navigationBar.backgroundColor = UIColor.Andes.yellowML500
        navigationController?.navigationBar.isTranslucent = true
        
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Clickeaste la fila \(indexPath.row)")
        
        let favorite = FavoritesStorage.shared.myFavorites[indexPath.row]
        let detailsPublication = ProductViewController()
        detailsPublication.product = favorite
        
        navigationController?.pushViewController(detailsPublication, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FavoritesStorage.shared.myFavorites.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let myFavorites = FavoritesStorage.shared.myFavorites[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell",
                                                 for: indexPath) as! FavoriteTableViewCell
        cell.loadWithData(myFavorites)
        return cell
    }
}
