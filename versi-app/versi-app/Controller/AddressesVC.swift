//
//  AddressesVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/8/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class AddressesVC: UIViewController {

    @IBOutlet weak var closeBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addAddressbtnPressed(_ sender: Any) {
        let vc = STORYBOARD.instantiateViewController(withIdentifier: ADDADDRESS) as! AddAddressVC
        navigationController?.pushViewController(vc, animated: true)
    }
}
