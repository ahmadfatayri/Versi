//
//  WishlistCollectionCell.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/9/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class WishlistCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageWishlist: UIImageView!
    @IBOutlet weak var titleWishlist: UILabel!
    @IBOutlet weak var priceWishlist: UILabel!
    @IBOutlet weak var addToCartBtn: borderButton!
    @IBOutlet weak var removeBtn: UIButton!
    
    
    var product: Product! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        imageWishlist.sd_setImage(with: URL(string: (product.images?.first)!), placeholderImage: UIImage(named: "placeholder_image"))
        titleWishlist.text = product.name
        if let price = product.price {
            priceWishlist.text = "$\(price)"
        } else {
            priceWishlist.text = ""
        }
    }
    
}
