//
//  CategoryCell.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/4/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var bgCategory: UIImageView!
    @IBOutlet weak var titleCategory: UILabel!
    @IBOutlet weak var descriptionCategory: UILabel!
    
    func config(title: String, description: String, bgCategory: String) {
        self.titleCategory.text = title
        self.descriptionCategory.text = description
        self.bgCategory.sd_setImage(with: URL(string: bgCategory), placeholderImage: UIImage(named: "placeholder_image"))
    }

}
