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
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITextField.connectFields(fields: [resetTextField])
        resetTextField.becomeFirstResponder()
        self.hideKeyboardWhenTappedAround()
        titleLbl.text = self.getByTagName(key: "titleLblForgotPass")
        descriptionLbl.text = self.getByTagName(key: "descriptionLblForgotPasswordPage")
        resetTextField.tweePlaceholder = self.getByTagName(key: "emailPlaceholder")
        resetPasswordBtn.setTitle(self.getByTagName(key: "ResetPassword"), for: .normal)
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated:true)
    }
    
    @IBAction func resetPasswordWasPressed(_ sender: Any) {
        
        guard let email = resetTextField.text , resetTextField.text != "" else {
            self.alert(message: self.getByTagName(key: "msgEmailErrorEmpty"))
            return
        }
        
        if !email.isValidEmailTwee() {
            self.alert(message: self.getByTagName(key: "msgEmailErrorValid"))
            return
        }
        
        loader.isHidden = false
        resetPasswordBtn.isEnabled = false
        AuthService.instance.forgotPassword(email: email) { (success) in
            self.loader.isHidden = true
            self.resetPasswordBtn.isEnabled = true
            if success {
                self.navigationController?.popToRootViewController(animated:true)
                self.alert(message: self.getByTagName(key: "msgForgotSuccess"))
            }
            else {
                self.alert(message: self.getByTagName(key: "msgForgotError"))
            }
        }
    }
}
