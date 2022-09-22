//
//  FavoriteTableViewCell.swift
//  skill-levelling
//
//  Created by Iara Denise Orosco on 21/09/2022.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblShipping: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    
    
    var favoritetbd: ResultOverview?


    override func awakeFromNib() {
        super.awakeFromNib()
      //  setupBtnDeleteFavorite()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
      
    
    func loadWithData(_ item: ResultOverview) {
        self.lblTitle?.text = item.title
        self.lblPrice?.text = "$ \(item.price)"
        self.accessoryType = .none
        var image: UIImage
        
        if let thumbnail = item.thumbnail {
            do {
                if let urll = URL(string: thumbnail) {
                    let data = try Data(contentsOf: urll)
                    image = UIImage(data: data)!
                } else {
                    print("Error al convertir url: \(thumbnail) con \(item.id)")
                    image = UIImage(systemName: "shippingbox.fill")!
                }
            } catch {
                image = UIImage(systemName: "shippingbox.fill")!
            }
        } else {
            print("No hay thumbnail id \(item.id)")
            image = UIImage(systemName: "shippingbox.fill")!
        }
        self.productImage?.image = image
        if let freeShipping = item.freeShipping {
            lblShipping.isHidden = !freeShipping
        } else {
            lblShipping.isEnabled = false
        }
    }
    
}


