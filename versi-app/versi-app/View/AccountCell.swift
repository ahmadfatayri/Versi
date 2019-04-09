//
//  AccountCell.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/5/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class AccountCell: UITableViewCell {

    @IBOutlet weak var iconAccount: UIImageView!
    @IBOutlet weak var titleAccount: UILabel!
    @IBOutlet weak var descriptionAccount: UILabel!
    
    func config(title: String, description: String, imageUrl: String) {
        self.titleAccount.text = title
        self.descriptionAccount.text = description
        self.iconAccount.image = UIImage(named: imageUrl)
    }

}
