//
//  SuggestionCollectionViewCell.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/5/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class SuggestionCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    var image: String! {
        didSet {
            self.imageView.downloaded(from: (image)!)

            //self.imageView.image = image
            self.setNeedsLayout()
        }
    }
    
}
