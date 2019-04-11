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
    
    func config(title: String, price: String, imageUrl: UIImage) {
        self.titleWishlist.text = title
        self.priceWishlist.text = price
        self.imageWishlist.image = imageUrl
    }

    
}
