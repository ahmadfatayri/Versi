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
    
    @IBAction func addAddressBtnPressed(_ sender: Any) {
        guard let name = nameTextField.text , nameTextField.text != "" else { return }
        guard let mobile = mobileTextField.text , mobileTextField.text != "" else { return }
        guard let pin = pinTextField.text , pinTextField.text != "" else { return }
        guard let state = stateTextField.text , stateTextField.text != "" else { return }
        guard let address_details = addressDetailsTextField.text , addressDetailsTextField.text != "" else { return }
        guard let town = townTextField.text , townTextField.text != "" else { return }
        guard let city = cityTextField.text , cityTextField.text != "" else { return }
        var is_home: Bool = false
        if forHomeSwitch.isOn == true {
            is_home = true
        }
        else {
            is_home = false
        }
        var is_default: Bool = false
        if defaultAddressSwitch.isOn == true {
            is_default = true
        }
        else {
            is_default = false
        }

        AddressService.instance.addData(name: name, mobile: mobile, pin_code: pin, state: state, address_details: address_details, town: town, city: city, is_home: is_home, is_default: is_default) { (success) in
            if success {
                self.navigationController?.popToRootViewController(animated: true)
                self.alert(message: "Address added successfully!")
            }
            else {
                self.alert(message: "Couldn't add this address!")
            }
        }
    }
    
}
