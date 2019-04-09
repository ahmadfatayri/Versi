//
//  FirstVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/8/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Root View";
        
    }

    @IBAction func showDetailsPressed(_ sender: Any) {
        performSegue(withIdentifier: "SegueFromRootToFirst", sender: self)
    }
}
