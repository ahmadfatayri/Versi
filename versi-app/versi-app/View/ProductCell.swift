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
    
    var product: Product! {
        didSet {
            self.updateUI()
        }
    }
    
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
    
}
