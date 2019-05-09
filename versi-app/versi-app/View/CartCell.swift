//
//  CartCell.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 5/9/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {

    @IBOutlet weak var cartImageView: UIImageView!
    @IBOutlet weak var cartTitle: UILabel!
    @IBOutlet weak var cartPrice: UILabel!
    @IBOutlet weak var cartRemoveBtn: UIButton!
    
    var product: Product! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        cartImageView.downloaded(from: (product.images?.first)!)
        cartTitle.text = product.name
        if let price = product.price {
            cartPrice.text = "$\(price)"
        } else {
            cartPrice.text = ""
        }
    }
    
}
