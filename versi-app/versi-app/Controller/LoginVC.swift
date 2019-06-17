//
//  LoginVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/2/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit
import TweeTextField

class LoginVC: UIViewController {

    
    
    
    @IBOutlet weak var passwordTextField: TweeAttributedTextField!
    @IBOutlet weak var usernameTextField: TweeAttributedTextField!
    @IBOutlet weak var loginBtn: borderButton!
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITextField.connectFields(fields: [usernameTextField, passwordTextField])
        usernameTextField.becomeFirstResponder()
        self.hideKeyboardWhenTappedAround() 
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated:true)
    }
    @IBAction func loginBtnPressed(_ sender: Any) {
        
        guard let email = usernameTextField.text , usernameTextField.text != "" else {
            self.alert(message: "Email textField cannot be empty!")
            return
        }
        guard let pass = passwordTextField.text , passwordTextField.text != "" else {
            self.alert(message: "Password textField cannot be empty!")
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
        loader.isHidden = false
        self.loginBtn.isEnabled = false
        AuthService.instance.loginUser(email: email, password: pass) { (success) in
            self.loader.isHidden = true
            self.loginBtn.isEnabled = true
            if success {
                let vc = STORYBOARD.instantiateViewController(withIdentifier: BOTTOMBAR) as! BottomBarVC
                self.navigationController?.setViewControllers([vc], animated: true)
            }
            else {
                self.alert(message: "Username or password not valid")
            }
        }
        
        
    }
    @IBAction func signupBtnPressed(_ sender: Any) {
        let vc = STORYBOARD.instantiateViewController(withIdentifier: SIGNUP) as! SignupVC
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func forgotPasswordBtnPressed(_ sender: Any) {
        let vc = STORYBOARD.instantiateViewController(withIdentifier: FORGOTPASSWORD) as! ForgotPasswordVC
        navigationController?.pushViewController(vc, animated: true)
    }
}

