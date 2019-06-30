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
    
    @IBAction func cartBtnPressed(_ sender: Any) {
        if addToCartBtn.currentTitle! == "Remove From Cart" {
            addToCartBtn.setTitle("Add To Cart", for: .normal)
        }
        else {
            //addToCartBtn.setTitle("Remove From Cart", for: .normal)
        }
        
    }
    
    func updateUI()
    {
        buyBtn.setTitle("Buy", for: .normal)
    }
   
}
