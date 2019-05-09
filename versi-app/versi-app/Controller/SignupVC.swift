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
        
        guard let name = fullnameTextField.text , fullnameTextField.text != "" else { return }
        guard let email = emailTextField.text , emailTextField.text != "" else { return }
        guard let pass = passwordTextField.text , passwordTextField.text != "" else { return }
        guard let phone = phoneTextField.text , phoneTextField.text != "" else { return }
        loader.isHidden = false
        AuthService.instance.registerUser(email: email, password: pass, name: name, phone: phone, gender: gender.rawValue) { (success) in
            self.loader.isHidden = true
            if success {
                let vc = STORYBOARD.instantiateViewController(withIdentifier: SIGNIN) as! LoginVC
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else {
                self.showToast(message: "Registration failed")
            }
        }
        
        
    }
    @IBAction func loginBtnPressed(_ sender: Any) {
        let vc = STORYBOARD.instantiateViewController(withIdentifier: SIGNIN) as! LoginVC   
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
