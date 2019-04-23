//
//  ProfileDetailsVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/12/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit
import TweeTextField

class ProfileDetailsVC: UIViewController {

    @IBOutlet weak var emailTextField: TweeAttributedTextField!
    @IBOutlet weak var phoneTextField: TweeAttributedTextField!
    @IBOutlet weak var nameTextField: TweeAttributedTextField!
    @IBOutlet weak var dobDatePicker: UIDatePicker!
    @IBOutlet weak var femaleBtn: borderButton!
    @IBOutlet weak var maleBtn: borderButton!
    
    var gender: GenderType = .female
    
    override func viewDidLoad() {
        super.viewDidLoad()
        femaleBtn.setSelectedColor()
        maleBtn.setDeselectedColor()
        
        UITextField.connectFields(fields: [emailTextField, nameTextField, phoneTextField])
        
    }
    

    @IBAction func maleBtnPressed(_ sender: Any) {
        maleBtn.setSelectedColor()
        femaleBtn.setDeselectedColor()
        gender = .male
    }
    @IBAction func femaleBtnPressed(_ sender: Any) {
        femaleBtn.setSelectedColor()
        maleBtn.setDeselectedColor()
        gender = .female
    }
    @IBAction func backBtnPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func changePassBtnPressed(_ sender: Any) {
        let vc = STORYBOARD.instantiateViewController(withIdentifier: CHANGEPASSWORD) as! ChangePasswordVC
        navigationController?.pushViewController(vc, animated: true)
    }
}
