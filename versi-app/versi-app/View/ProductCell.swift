//
//  ProductCell.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/5/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var titleProduct: UILabel!
    @IBOutlet weak var priceProduct: UILabel!
    @IBOutlet weak var loveBtn: UIButton!
    
    var product: Product! {
        didSet {
            self.updateUI()
        }
    }
    
    var isLiked: LikedImage = .disliked
    
    func updateUI()
    {
        imageProduct.image = product.images?.first
        titleProduct.text = product.name
        if let price = product.price {
            priceProduct.text = "$\(price)"
        } else {
            priceProduct.text = ""
        }
    }
    
    @IBAction func loveBtnPressed(_ sender: Any) {
        if isLiked.rawValue == "false" {
            loveBtn.setLikedImage()
            isLiked = .liked
        }
        else {
            loveBtn.setDisLikedImage()
            isLiked = .disliked
        }
        
    }
}
