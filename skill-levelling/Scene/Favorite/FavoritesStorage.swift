//
//  FavoritesStorage.swift
//  skill-levelling
//
//  Created by Iara Denise Orosco on 21/09/2022.
//

import Foundation
import PromiseKit

class FavoritesStorage {
    
    static var shared = FavoritesStorage()
    let KEY_FAVORITES = "favorites_json"
    
    var myFavorites: [ResultOverview] = []
    
    private var listeners: [()->Void] = []
    
    init() { load() }
    
    
    func addDataChanged(listener: @escaping ()->Void){
        listeners.append(listener)
    }
    
    func save(){
        let encoder = JSONEncoder()
        if let dataJson = try? encoder.encode(myFavorites){
            UserDefaults.standard.set(dataJson, forKey: KEY_FAVORITES)
        } else {
            
            print("No se pudo convertir a JSON")
        }
    }
    
    
    func load(){
        if let dataJson = UserDefaults.standard.data(forKey: KEY_FAVORITES) {
            let decoder = JSONDecoder()
            do {
                myFavorites = try decoder.decode([ResultOverview].self, from: dataJson)
            } catch {
                //si hay error, queda el array vacío
                print("No se pudo convertir el JSON")
            }
        }
    }
    
    func nofityUpdates(){
        //hubo cambios en los datos
        save()
        //recorro los listeners y los invoco
        for listener in listeners{
            listener()
        }
    }
    
    
    func add(favorite: ResultOverview) {
        myFavorites.append(favorite)
        nofityUpdates()
        
    }
    
    func delete(favorite: ResultOverview){
        myFavorites.removeAll { currentPublication in
            return currentPublication == favorite
        }
        nofityUpdates()
    }
    
    
    
    func myFavoritesPromise() -> Promise<[ResultOverview]> {
        return Promise { resolver in
            resolver.fulfill(self.myFavorites)
        }
    }
}
