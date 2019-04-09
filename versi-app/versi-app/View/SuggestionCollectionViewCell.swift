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
    
    var image: UIImage! {
        didSet {
            self.imageView.image = image
            self.setNeedsLayout()
        }
    }
    
}
