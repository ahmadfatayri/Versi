//
//  SignupVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/4/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit
import TweeTextField

class SignupVC: UIViewController {

    
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var emailTextField: TweeAttributedTextField!
    @IBOutlet weak var passwordTextField: TweeAttributedTextField!
    @IBOutlet weak var fullnameTextField: TweeAttributedTextField!
    @IBOutlet weak var phoneTextField: TweeAttributedTextField!
    @IBOutlet weak var createAccountBtn: borderButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var femaleBtn: borderButton!
    @IBOutlet weak var maleBtn: borderButton!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    var gender: GenderType = .female
    
    override func viewDidLoad() {
        super.viewDidLoad()
        femaleBtn.setSelectedColor()
        maleBtn.setDeselectedColor()
        
        UITextField.connectFields(fields: [emailTextField, passwordTextField, fullnameTextField, phoneTextField])
        emailTextField.becomeFirstResponder()
        self.hideKeyboardWhenTappedAround()
    }
    
    
    @IBAction func femaleBtnWasPressed(_ sender: Any) {
        femaleBtn.setSelectedColor()
        maleBtn.setDeselectedColor()
        gender = .female
    }
    
    @IBAction func maleBtnWasPressed(_ sender: Any) {
        maleBtn.setSelectedColor()
        femaleBtn.setDeselectedColor()
        gender = .male
    }
    
    
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated:true)
    }
    @IBAction func createAccountPressed(_ sender: Any) {
        
        guard let email = emailTextField.text , emailTextField.text != "" else {
            self.alert(message: "Email textField cannot be empty!")
            return
        }
        guard let pass = passwordTextField.text , passwordTextField.text != "" else {
            self.alert(message: "Password textField cannot be empty!")
            return
        }
        guard let name = fullnameTextField.text , fullnameTextField.text != "" else {
            self.alert(message: "Full Name textField cannot be empty!")
            return
        }
        guard let phone = phoneTextField.text , phoneTextField.text != "" else {
            self.alert(message: "Phone Number textField cannot be empty!")
            return
        }
        
        if !email.isValidEmailTwee() {
            self.alert(message: "Enter a valid email address!")
            return
        }
        if !pass.minTextFieldTwee(minString: 6) {
            self.alert(message: "Minimum 6 characters required for Password")
            return
        }
        if !phone.minTextFieldTwee(minString: 8) {
            self.alert(message: "Minimum 8 characters required for Phone")
            return
        }
        
        loader.isHidden = false
        createAccountBtn.isEnabled = false
        AuthService.instance.registerUser(email: email, password: pass, name: name, phone: phone, gender: gender.rawValue) { (success) in
            self.loader.isHidden = true
            self.createAccountBtn.isEnabled = true
            if success {
                let vc = STORYBOARD.instantiateViewController(withIdentifier: SIGNIN) as! LoginVC
                self.navigationController?.pushViewController(vc, animated: true)
                self.alert(message: "Registration succeed")
            }
            else {
                self.alert(message: "Registration failed!")
            }
        }
        
        
    }
    @IBAction func loginBtnPressed(_ sender: Any) {
        let vc = STORYBOARD.instantiateViewController(withIdentifier: SIGNIN) as! LoginVC   
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
