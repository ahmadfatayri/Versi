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
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated:true)
    }
    
    @IBAction func resetPasswordWasPressed(_ sender: Any) {
        //loader.isHidden = true
        //self.loader.isHidden = false

        navigationController?.popToRootViewController(animated:true)
    }
}
