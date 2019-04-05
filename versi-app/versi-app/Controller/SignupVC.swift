//
//  SignupVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/4/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit
import RYFloatingInput

class SignupVC: UIViewController {

    
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var emailTextField: RYFloatingInput!
    @IBOutlet weak var passwordTextField: RYFloatingInput!
    @IBOutlet weak var fullnameTextField: RYFloatingInput!
    @IBOutlet weak var phoneTextField: RYFloatingInput!
    @IBOutlet weak var createAccountBtn: borderButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var femaleBtn: borderButton!
    @IBOutlet weak var maleBtn: borderButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configInput()
        femaleBtn.setSelectedColor()
        maleBtn.setDeselectedColor()
    }
    
    
    @IBAction func femaleBtnWasPressed(_ sender: Any) {
        femaleBtn.setSelectedColor()
        maleBtn.setDeselectedColor()
    }
    
    @IBAction func maleBtnWasPressed(_ sender: Any) {
        maleBtn.setSelectedColor()
        femaleBtn.setDeselectedColor()
    }
    
    func configInput() {
        let emailSetting = RYFloatingInputSetting.Builder.instance()
            //.theme(.dark)
            //.iconImage(UIImage(named: "image_name")!)
            .placeholer("Email address")
            //.secure(true)
            .backgroundColor(.clear)
            .textColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            .placeholderColor(.lightGray)
            .dividerColor(.lightGray)
            .cursorColor(#colorLiteral(red: 0.9245222211, green: 0.2878485918, blue: 0.1882302463, alpha: 0.85))
            .accentColor(#colorLiteral(red: 0.9245222211, green: 0.2878485918, blue: 0.1882302463, alpha: 0.85))
            .warningColor(.red)
            .build()
        
        let fullnameSetting = RYFloatingInputSetting.Builder.instance()
            //.theme(.dark)
            //.iconImage(UIImage(named: "image_name")!)
            .placeholer("Full Name")
            //.secure(true)
            .backgroundColor(.clear)
            .textColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            .placeholderColor(.lightGray)
            .dividerColor(.lightGray)
            .cursorColor(#colorLiteral(red: 0.9245222211, green: 0.2878485918, blue: 0.1882302463, alpha: 0.85))
            .accentColor(#colorLiteral(red: 0.9245222211, green: 0.2878485918, blue: 0.1882302463, alpha: 0.85))
            .warningColor(.red)
            .build()
        
        let phonenumberSetting = RYFloatingInputSetting.Builder.instance()
            //.theme(.dark)
            //.iconImage(UIImage(named: "image_name")!)
            .placeholer("Mobile Number")
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
        
        emailTextField.setup(setting: emailSetting)
        passwordTextField.setup(setting: passwordSetting)
        phoneTextField.setup(setting: phonenumberSetting)
        fullnameTextField.setup(setting: fullnameSetting)

    }
    
}
