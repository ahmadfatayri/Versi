//
//  WelcomeVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/8/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var skiploginBtn: borderButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.isHidden = true
    }
    @IBAction func fbBtnWasPressed(_ sender: Any) {
        skiploginBtn.isEnabled = false
        loader.isHidden = false
        AuthService.instance.skipLogin(email: (UIDevice.current.identifierForVendor?.uuidString)!
 + "_" + USERNAME) {(success) in
            self.loader.isHidden = true
            self.skiploginBtn.isEnabled = true
            if success {
                let vc = STORYBOARD.instantiateViewController(withIdentifier: BOTTOMBAR) as! BottomBarVC
                self.navigationController?.setViewControllers([vc], animated: true)
            }
        }
        
    }
    @IBAction func loginBtnWasPressed(_ sender: Any) {
        let vc = STORYBOARD.instantiateViewController(withIdentifier: SIGNIN) as! LoginVC
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func signupBtnPressed(_ sender: Any) {
        let vc = STORYBOARD.instantiateViewController(withIdentifier: SIGNUP) as! SignupVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
