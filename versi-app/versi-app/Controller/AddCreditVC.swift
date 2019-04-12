//
//  AddCreditVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/12/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit
import TweeTextField

class AddCreditVC: UIViewController {

    @IBOutlet weak var creditCardNbLbl: UILabel!
    @IBOutlet weak var creditCardHolderLbl: UILabel!
    @IBOutlet weak var creditCardExpDateLbl: UILabel!
    
    @IBOutlet weak var creditCardHolderTextField: TweeAttributedTextField!
    @IBOutlet weak var creditCardNbTextField: TweeAttributedTextField!
    @IBOutlet weak var creditCardCVCTextField: TweeAttributedTextField!
    @IBOutlet weak var creditCardExpDateTextField: TweeAttributedTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITextField.connectFields(fields: [creditCardHolderTextField, creditCardNbTextField, creditCardCVCTextField, creditCardExpDateTextField])
        
        creditCardHolderTextField.addTarget(self, action: #selector(textFieldHolderDidChange(_:)), for: .editingChanged)
        creditCardNbTextField.addTarget(self, action: #selector(textFieldNbDidChange(_:)), for: .editingChanged)
        creditCardExpDateTextField.addTarget(self, action: #selector(textFieldExpDidChange(_:)), for: .editingChanged)

     }
    
    @objc func textFieldHolderDidChange(_ textField: UITextField) {
        if creditCardHolderTextField.text == "" {
            creditCardHolderLbl.text = "JOHN DEO JR"
        }
        else {
            creditCardHolderLbl.text = creditCardHolderTextField.text?.uppercased()
        }
    }
    
    @objc func textFieldNbDidChange(_ textField: UITextField) {
        if creditCardNbTextField.text == "" {
            creditCardNbLbl.text = "2435 5346 2345 6234"
        }
        else {
            let spaceCount = creditCardNbTextField.text!.filter{$0 == " "}.count

            if ((creditCardNbTextField.text?.count)! - spaceCount) % 4 == 0 && (creditCardNbTextField.text?.count)! != 0 {
                creditCardNbTextField.text = creditCardNbTextField.text! + " "
            }
            creditCardNbLbl.text = creditCardNbTextField.text
        }
    }
    
    @objc func textFieldExpDidChange(_ textField: UITextField) {
        if creditCardExpDateTextField.text == "" {
            creditCardExpDateLbl.text = "03/20"
        }
        else {
            if (creditCardExpDateTextField.text?.count)! == 2 {
                creditCardExpDateTextField.text = creditCardExpDateTextField.text! + "/"
            }
            creditCardExpDateLbl.text = creditCardExpDateTextField.text
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
