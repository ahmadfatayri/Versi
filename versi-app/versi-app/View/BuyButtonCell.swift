//
//  BuyButtonCell.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/16/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class BuyButtonCell: UITableViewCell {

    @IBOutlet weak var addToCartBtn: UIButton!
    @IBOutlet weak var buyBtn: UIButton!
    
    var product: Product! {
        didSet {
            self.updateUI()
        }
    }
    
    
    func updateUI()
    {
        
        if let price = product.price {
            buyBtn.setTitle("BUY $\(price)", for: .normal)
        } else {
            buyBtn.setTitle("", for: .normal)
        }
    }
   
}
