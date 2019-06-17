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
    @IBOutlet weak var qrcodeImage: UIImageView!
    
    var product: Product! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        productNameLabel.text = product.name
        productDescriptionLabel.text = product.description
        qrcodeImage.sd_setImage(with: URL(string: product.qr_code!), placeholderImage: UIImage(named: "placeholder_image"))
    }

}
