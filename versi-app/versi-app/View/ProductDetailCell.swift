//
//  ProductDetailCell.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/5/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class ProductDetailCell: UITableViewCell {

    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    var product: Product! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        productNameLabel.text = product.name
        productDescriptionLabel.text = product.description
    }

}
