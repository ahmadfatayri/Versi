//
//  LoginVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/2/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit
import RYFloatingInput

class LoginVC: UIViewController {

    
    
    @IBOutlet weak var usernameTextField: RYFloatingInput!
    @IBOutlet weak var passwordTextField: RYFloatingInput!
    @IBOutlet weak var loginBtn: borderButton!
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    @IBOutlet weak var closeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configInput()
    }
    
    func configInput() {
        let usernameSetting = RYFloatingInputSetting.Builder.instance()
            //.theme(.dark)
            //.iconImage(UIImage(named: "image_name")!)
            .placeholer("Mobile Number/Email ID")
            //.secure(true)
            .backgroundColor(.clear)
            .textColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            .placeholderColor(.lightGray)
            .dividerColor(.lightGray)
            .cursorColor(#colorLiteral(red: 0.9245222211, green: 0.2878485918, blue: 0.1882302463, alpha: 0.85))
            .accentColor(#colorLiteral(red: 0.9245222211, green: 0.2878485918, blue: 0.1882302463, alpha: 0.85))
            .warningColor(.red)
            .build()
        
        let passwordSetting = RYFloatingInputSetting.Builder.instance()
            //.theme(.dark)
            //.iconImage(UIImage(named: "image_name")!)
            .placeholer("Password")
            .secure(true)
            .backgroundColor(.clear)
            .textColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            .placeholderColor(.lightGray)
            .dividerColor(.lightGray)
            .cursorColor(#colorLiteral(red: 0.9245222211, green: 0.2878485918, blue: 0.1882302463, alpha: 0.85))
            .accentColor(#colorLiteral(red: 0.9245222211, green: 0.2878485918, blue: 0.1882302463, alpha: 0.85))
            .warningColor(.red)
            .build()
        
        usernameTextField.setup(setting: usernameSetting)
        passwordTextField.setup(setting: passwordSetting)
    }

    @IBAction func closeBtnWasPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated:true)
    }
    @IBAction func loginBtnPressed(_ sender: Any) {
        
       
        guard let email = usernameTextField.text() , usernameTextField.text() != "" else { return }
        guard let pass = passwordTextField.text() , passwordTextField.text() != "" else { return }
        
       
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

