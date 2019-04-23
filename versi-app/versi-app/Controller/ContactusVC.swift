//
//  ContactusVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/23/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class ContactusVC: UIViewController {

    @IBOutlet weak var msgTextView: borderTextView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func backBtnPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func btnSendPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
