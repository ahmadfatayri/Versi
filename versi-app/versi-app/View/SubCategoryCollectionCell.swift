//
//  SubCategoryCollectionCell.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/12/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

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
        subCategoryImage.downloaded(from: subCategory.image, contentMode: .scaleAspectFit)
        subCategoryTitle.text = subCategory.title
    }
    
}
