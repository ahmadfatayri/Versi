//
//  ChangePasswordVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/23/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit
import TweeTextField

class ChangePasswordVC: UIViewController {

    @IBOutlet weak var oldPassTextField: TweeAttributedTextField!
    @IBOutlet weak var newPassTextField: TweeAttributedTextField!
    @IBOutlet weak var confirmPassTextField: TweeAttributedTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITextField.connectFields(fields: [oldPassTextField, newPassTextField, confirmPassTextField])

    }

    @IBAction func backBtnPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
