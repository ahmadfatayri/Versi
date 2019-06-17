//
//  CardCell.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 5/20/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {

    @IBOutlet weak var cardTitle: UILabel!
    @IBOutlet weak var cardNumber: UILabel!
    
    var card: Card! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        
        self.cardTitle.text = card.name
        self.cardNumber.text = "**** **** **** " + String(card.number!.suffix(4))
    }
}
