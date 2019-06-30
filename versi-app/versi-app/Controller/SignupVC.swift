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
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nowLbl: UILabel!
    
    var gender: GenderType = .female
    
    override func viewDidLoad() {
        super.viewDidLoad()
        femaleBtn.setSelectedColor()
        maleBtn.setDeselectedColor()
        
        UITextField.connectFields(fields: [emailTextField, passwordTextField, fullnameTextField, phoneTextField])
        emailTextField.becomeFirstResponder()
        self.hideKeyboardWhenTappedAround()
        emailTextField.tweePlaceholder = self.getByTagName(key: "emailPlaceholder")
        passwordTextField.tweePlaceholder = self.getByTagName(key: "passwordPlaceholder")
        fullnameTextField.tweePlaceholder = self.getByTagName(key: "fullnamePlaceholder")
        phoneTextField.tweePlaceholder = self.getByTagName(key: "mobileNumberPlaceholder")
        titleLbl.text = self.getByTagName(key: "signup")
        genderLbl.text = self.getByTagName(key: "genderLbl")
        descriptionLbl.text = self.getByTagName(key: "DescriptionLblSigninPage")
        nowLbl.text = self.getByTagName(key: "Now")
        femaleBtn.setTitle(self.getByTagName(key: "female"), for: .normal)
        maleBtn.setTitle(self.getByTagName(key: "male"), for: .normal)
        loginBtn.setTitle(self.getByTagName(key: "signin"), for: .normal)
        createAccountBtn.setTitle(self.getByTagName(key: "signup"), for: .normal)

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
            self.alert(message: self.getByTagName(key: "msgEmailErrorEmpty"))
            return
        }
        guard let pass = passwordTextField.text , passwordTextField.text != "" else {
            self.alert(message: self.getByTagName(key: "msgPasswordErrorEmpty"))
            return
        }
        guard let name = fullnameTextField.text , fullnameTextField.text != "" else {
            self.alert(message: self.getByTagName(key: "msgFullnameErrorEmpty"))
            return
        }
        guard let phone = phoneTextField.text , phoneTextField.text != "" else {
            self.alert(message: self.getByTagName(key: "msgPhoneErrorEmpty"))
            return
        }
        
        if !email.isValidEmailTwee() {
            self.alert(message: self.getByTagName(key: "msgEmailErrorValid"))
            return
        }
        if !pass.minTextFieldTwee(minString: 6) {
            self.alert(message: self.getByTagName(key: "msgMinimumError"))
            return
        }
        if !phone.minTextFieldTwee(minString: 8) {
            self.alert(message: self.getByTagName(key: "msgMinimumPhoneError"))
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
                self.alert(message: self.getByTagName(key: "msgRegisterError"))
            }
            else {
                self.alert(message: self.getByTagName(key: "msgRegisterSuccess"))
            }
        }
        
        
    }
    @IBAction func loginBtnPressed(_ sender: Any) {
        let vc = STORYBOARD.instantiateViewController(withIdentifier: SIGNIN) as! LoginVC   
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
