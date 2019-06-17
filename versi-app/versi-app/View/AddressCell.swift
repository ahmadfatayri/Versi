//
//  addressCell.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 5/21/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class AddressCell: UITableViewCell {

    @IBOutlet weak var addressTitle: UILabel!
    @IBOutlet weak var addressDetails: UILabel!
    
    var address: Address! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        self.addressTitle.text = address.name
        self.addressDetails.text = address.address_details! + ", " + address.town! + ", " + address.city!
    }
}
