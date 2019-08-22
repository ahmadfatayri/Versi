//
//  SubSubCatCollectionCell.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/12/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class SubSubCatCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    var product: Product! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        productImage.sd_setImage(with: URL(string: (product.images?.first)!), placeholderImage: UIImage(named: "placeholder_image"))
        productTitle.text = product.name
        if let price = product.price {
            productPrice.text = "$\(price)"
        } else {
            productPrice.text = ""
        }
    }
}
