//
//  ContactusVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/23/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class ContactusVC: UIViewController {

    @IBOutlet weak var msgTextView: borderTextView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func backBtnPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSendPressed(_ sender: Any) {
        
        guard let msg = msgTextView.text , msgTextView.text != "" else { return }
        loader.isHidden = false
        ContactusService.instance.sendData(msg: msg) { (success) in
            self.loader.isHidden = true
            if success {
                self.alert(message: "Message sent successfuly!")
            }
            else {
                self.alert(message: "Message faild")
            }
        }
        
    }
}
