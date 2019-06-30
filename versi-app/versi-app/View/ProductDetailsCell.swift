//
//  ProductDetailsCell.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 6/18/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit
class ProductDetailsCell: UITableViewCell {
    
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    var product: Product! {
        didSet {
            self.updateUI()
        }
    }
    
   
    func updateUI()
    {
        descriptionLbl.text = "\(getByTagName(key: "priceLbl")): \(self.product.price ?? 100)"
    }
    
   
}
