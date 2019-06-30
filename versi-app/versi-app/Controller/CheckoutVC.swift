//
//  CheckoutVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/23/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit
import WebKit

class CheckoutVC: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var doneLbl: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://stripe-payments-demo.appspot.com/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        doneLbl.setTitle(self.getByTagName(key: "doneLbl"), for: .normal)
    }
    
    @IBAction func doneBtnPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}
