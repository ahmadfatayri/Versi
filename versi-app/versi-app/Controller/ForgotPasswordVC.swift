//
//  ForgotPasswordVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/4/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit
import RYFloatingInput

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var resetTextField: RYFloatingInput!
    @IBOutlet weak var resetPasswordBtn: borderButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configInput()
    }
    
    func configInput() {
        let emailSetting = RYFloatingInputSetting.Builder.instance()
            //.theme(.dark)
            //.iconImage(UIImage(named: "image_name")!)
            .placeholer("Registered email ID/ Phone number")
            //.secure(true)
            .backgroundColor(.clear)
            .textColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            .placeholderColor(.lightGray)
            .dividerColor(.lightGray)
            .cursorColor(#colorLiteral(red: 0.9245222211, green: 0.2878485918, blue: 0.1882302463, alpha: 0.85))
            .accentColor(#colorLiteral(red: 0.9245222211, green: 0.2878485918, blue: 0.1882302463, alpha: 0.85))
            .warningColor(.red)
            .build()
        
        resetTextField.setup(setting: emailSetting)
        
    }
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated:true)
    }
    
    @IBAction func resetPasswordWasPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated:true)
    }
}
