//
//  AddAddressVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/9/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit
import TweeTextField

class AddAddressVC: UIViewController {

   
    @IBOutlet weak var nameTextField: TweePlaceholderTextField!
    @IBOutlet weak var mobileTextField: TweePlaceholderTextField!
    @IBOutlet weak var pinTextField: TweeAttributedTextField!
    @IBOutlet weak var stateTextField: TweeAttributedTextField!
    @IBOutlet weak var addressDetailsTextField: TweeAttributedTextField!
    @IBOutlet weak var townTextField: TweeAttributedTextField!
    @IBOutlet weak var cityTextField: TweeAttributedTextField!
    @IBOutlet weak var forHomeSwitch: UISwitch!
    @IBOutlet weak var defaultAddressSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITextField.connectFields(fields: [nameTextField, mobileTextField, pinTextField, stateTextField, addressDetailsTextField, townTextField, cityTextField])

    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}
