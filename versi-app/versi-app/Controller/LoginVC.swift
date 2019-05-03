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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITextField.connectFields(fields: [usernameTextField, passwordTextField])
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated:true)
    }
    @IBAction func loginBtnPressed(_ sender: Any) {
        
        guard let email = usernameTextField.text , usernameTextField.text != "" else { return }
        guard let pass = passwordTextField.text , passwordTextField.text != "" else { return }
        
       
        AuthService.instance.loginUser(email: email, password: pass) { (success) in
            if success {
                let vc = STORYBOARD.instantiateViewController(withIdentifier: BOTTOMBAR) as! BottomBarVC
                self.present(vc, animated: true, completion: nil)
            }
            else {
                self.showToast(message: "Username or password not valid")
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

