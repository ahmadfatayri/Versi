//
//  ForgotPasswordVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/4/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit
import TweeTextField

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var resetTextField: TweeAttributedTextField!
    @IBOutlet weak var resetPasswordBtn: borderButton!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITextField.connectFields(fields: [resetTextField])
        resetTextField.becomeFirstResponder()
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated:true)
    }
    
    @IBAction func resetPasswordWasPressed(_ sender: Any) {
        
        guard let email = resetTextField.text , resetTextField.text != "" else {
            self.alert(message: "Email textField cannot be empty!")
            return
        }
        
        if !email.isValidEmailTwee() {
            self.alert(message: "Enter a valid email address!")
            return
        }
        
        loader.isHidden = false
        resetPasswordBtn.isEnabled = false
        AuthService.instance.forgotPassword(email: email) { (success) in
            self.loader.isHidden = true
            self.resetPasswordBtn.isEnabled = true
            if success {
                self.navigationController?.popToRootViewController(animated:true)
                self.alert(message: "Your password has been changed, Please check your mail.")
            }
            else {
                self.alert(message: "Your password has not been changed, Please try again.")
            }
        }
    }
}
