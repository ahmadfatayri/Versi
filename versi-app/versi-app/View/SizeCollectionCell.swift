//
//  SizeCollectionCell.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 5/9/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class SizeCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var sizeLbl: UILabel!
    
    func config(sizeLbl: String) {
        self.sizeLbl.text = sizeLbl
    }
    
}
