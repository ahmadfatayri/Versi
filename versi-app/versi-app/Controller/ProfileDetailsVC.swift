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
    var profile: Profile?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        femaleBtn.setSelectedColor()
        maleBtn.setDeselectedColor()
        dobDatePicker.datePickerMode = UIDatePicker.Mode.date
        emailTextField.isUserInteractionEnabled = false
        UITextField.connectFields(fields: [emailTextField, nameTextField, phoneTextField])
    
        ProfileService.instance.loadData(completion:  {data in
            self.emailTextField.text = data.email
            self.nameTextField.text = data.full_name
            self.phoneTextField.text = data.mobile_number
            if data.gender == "male" {
                self.maleBtn.setSelectedColor()
                self.femaleBtn.setDeselectedColor()
                self.gender = .male
            }
            else {
                self.femaleBtn.setSelectedColor()
                self.maleBtn.setDeselectedColor()
                self.gender = .female
            }
            var dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let date = dateFormatter.date(from: data.dob!)
            
            self.dobDatePicker.setDate(date!, animated: false)
        })
        
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
    @IBAction func updateProfileBtnPressed(_ sender: Any) {
        
        dobDatePicker.datePickerMode = UIDatePicker.Mode.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let selectedDate = dateFormatter.string(from: dobDatePicker.date)
        
        guard let name = nameTextField.text , nameTextField.text != "" else { return }
        guard let email = emailTextField.text , emailTextField.text != "" else { return }
        guard let phone = phoneTextField.text , phoneTextField.text != "" else { return }

        ProfileService.instance.addData(name: name, email: email, mobile_number: phone, dob: selectedDate) { (success) in
            if success {
                self.alert(message: "Profile updated successfully")
            }
            else {
                self.alert(message: "Couldn't update profile")
            }
        }
        
    }
}
