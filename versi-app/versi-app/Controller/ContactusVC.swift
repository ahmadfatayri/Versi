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
    @IBOutlet weak var callBtn: borderButton!
    @IBOutlet weak var content: UILabel!
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
    
    @IBAction func callBtnPressed(_ sender: Any) {
        let url: NSURL = URL(string: "TEL://1234567890")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
}
