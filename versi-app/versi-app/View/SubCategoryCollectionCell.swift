//
//  SubCategoryCollectionCell.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/12/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit
import SDWebImage

class SubCategoryCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var subCategoryImage: UIImageView!
    @IBOutlet weak var subCategoryTitle: UILabel!
    
    var subCategory: SubCategory! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        subCategoryImage.sd_setImage(with: URL(string: subCategory.image), placeholderImage: UIImage(named: "placeholder_image"))
        subCategoryTitle.text = subCategory.title
    }
    
}
