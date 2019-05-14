//
//  HelpVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/24/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit
import WebKit

class HelpVC: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://support.mail.com/index.html")
        let myRequest = URLRequest(url: myURL!)
        webview.load(myRequest)
        
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
