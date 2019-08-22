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
    @IBOutlet weak var loveBtn: UIButton!
    
    var product: Product! {
        didSet {
            self.updateUI()
        }
    }
    
    var isLiked: LikedImage = .disliked
    
    func updateUI()
    {
        productNameLabel.text = product.name
        productDescriptionLabel.text = product.description
        qrcodeImage.sd_setImage(with: URL(string: product.qr_code!), placeholderImage: UIImage(named: "placeholder_image"))
        if product.isLiked == true {
            loveBtn.setLikedImage()
            isLiked = .liked
        }
    }

    @IBAction func loveBtnPressed(_ sender: Any) {
        if isLiked.rawValue == "false" {
            loveBtn.setLikedImage()
            isLiked = .liked
            WishlistService.instance.addData(product_id: self.product.uid! ){ (success) in
                if success {
                    
                }
                else {
                    
                }
            }
        }
        else {
            loveBtn.setDisLikedImage()
            isLiked = .disliked
            WishlistService.instance.removeData(product_id: self.product.uid! ){ (success) in
                if success {
                    
                }
                else {
                    
                }
            }
        }
    }
}
