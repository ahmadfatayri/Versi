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
    @IBOutlet weak var loveBtn: UIButton!
    
    var isLiked: LikedImage = .disliked
    
    var product: Product! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        productImage.downloaded(from: (product.images?.first)!)
//        productImage.image = product.images?.first
        productTitle.text = product.name
        if let price = product.price {
            productPrice.text = "$\(price)"
        } else {
            productPrice.text = ""
        }
    }
    
    @IBAction func loveBtnPressed(_ sender: UIButton) {
        if isLiked.rawValue == "false" {
            loveBtn.setLikedImage()
            isLiked = .liked
        }
        else {
            loveBtn.setDisLikedImage()
            isLiked = .disliked
        }
    }
    
}
