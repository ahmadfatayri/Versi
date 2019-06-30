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
    @IBOutlet weak var newversiLbl: UILabel!
    @IBOutlet weak var nowLbl: UILabel!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITextField.connectFields(fields: [usernameTextField, passwordTextField])
        usernameTextField.becomeFirstResponder()
        self.hideKeyboardWhenTappedAround()
        usernameTextField.tweePlaceholder = self.getByTagName(key: "emailPlaceholder")
        passwordTextField.tweePlaceholder = self.getByTagName(key: "passwordPlaceholder")
        loginBtn.setTitle(self.getByTagName(key: "signin"), for: .normal)
        forgotPasswordBtn.setTitle(self.getByTagName(key: "Forgotpassword"), for: .normal)
        newversiLbl.text = self.getByTagName(key: "DescriptionLblLoginPage")
        nowLbl.text = self.getByTagName(key: "Now")
        signupBtn.setTitle(self.getByTagName(key: "signup"), for: .normal)
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated:true)
    }
    @IBAction func loginBtnPressed(_ sender: Any) {
        
        guard let email = usernameTextField.text , usernameTextField.text != "" else {
            self.alert(message: self.getByTagName(key: "msgEmailErrorEmpty"))
            return
        }
        guard let pass = passwordTextField.text , passwordTextField.text != "" else {
            self.alert(message: self.getByTagName(key: "msgPasswordErrorEmpty"))
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
                self.alert(message: self.getByTagName(key: "msgLoginError"))
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

