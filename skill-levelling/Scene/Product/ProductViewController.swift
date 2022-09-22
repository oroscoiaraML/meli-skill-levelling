//
//  ProductViewController.swift
//  skill-levelling
//
//  Created by Iara Denise Orosco on 18/09/2022.
//
import UIKit

class ProductViewController: UIViewController {
    
    
    var callback: ((Bool) -> Void)?
    
    func set(callback: @escaping (Bool) -> Void) {
        self.callback = callback
    }
    
    
    
    @IBOutlet weak var lblSoldCondition: UILabel!
    @IBOutlet weak var lblProduct: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnFavorite: UIButton!
    @IBOutlet weak var imgTest: UIImageView!
    @IBOutlet weak var lblStock: UILabel!
    @IBOutlet weak var btnBuy: UIButton!
    @IBAction func btnFavoritePressed(_ sender: UIButton) {
        
        btnFavorite.isSelected = !btnFavorite.isSelected
        if btnFavorite.isSelected{
            btnFavorite.tintColor = UIColor.systemBlue
        }
    }
    
    var storage = FavoritesStorage()
    
    var product: ResultOverview!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBtnBack()
        setupBtnFavorite()
        setupLblStock()
        setupBar()
        setupProduct()
    }
    
    
    func setupLblStock() {
        lblStock.text = "Stock disponible"
    }
    
    func setupBar() {
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    @objc func buttonAction(){
        
        FavoritesStorage.shared.add(favorite: product)
        
        if storage.myFavorites.contains(product) {
            if btnFavorite.isTouchInside {
                FavoritesStorage.shared.delete(favorite: product)
            }
        }
        
        dismiss(animated: true)
        
        if let callback = callback {
            callback(true)
        }
    }
    
    
    func setupProduct() {
        do {
            let url = URL(string: self.product!.picturesURL.first!!)
            let data = try Data(contentsOf: url!)
            self.imgTest.image = UIImage(data: data)
        } catch {
            print(error)
        }
        lblProduct.text = product?.title
        if let price = self.product?.price {
            lblPrice.text = "$ \(price)"
        }
        if let condition = self.product?.condition {
            lblSoldCondition.text = "\(condition.capitalized) | \(self.product!.soldQuantity) vendidos"
        }
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupBtnBack() {
        let imageBack = UIImage(systemName: "arrow.backward")
        btnBack.setImage(imageBack, for: .normal)
        btnBack.tintColor = .black
    }
    
    func setupBtnFavorite() {
        let imageBack = UIImage(
            systemName: "heart")
        btnFavorite.setImage(imageBack, for: .normal)
        btnFavorite.tintColor = .black
        btnFavorite.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        if storage.myFavorites.contains(product) {
            btnFavorite.isSelected = !btnFavorite.isSelected
            btnFavorite.tintColor = UIColor.systemBlue
            
        }
    }
    
    
}
