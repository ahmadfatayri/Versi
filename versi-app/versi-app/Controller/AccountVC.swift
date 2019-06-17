//
//  AccountVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/4/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class AccountVC: UIViewController {

    @IBOutlet weak var logoutBtn: borderButton!
    @IBOutlet weak var logTableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        logTableView.delegate = self as UITableViewDelegate
        logTableView.dataSource = self as UITableViewDataSource
        logTableView.isScrollEnabled = false;

    }
    
    @IBAction func logoutBtnPressed(_ sender: Any) {
        KeychainService.removeKey(service: SERVICEKEY, account: ACCOUNTKEY)
        let defaults = UserDefaults.standard
        defaults.set("", forKey: DEFAULTKEY.role)
        let vc = STORYBOARD.instantiateViewController(withIdentifier: WELCOME) as! WelcomeVC
        navigationController?.setViewControllers([vc], animated: true)
    }
    func shareApp() {
        let text = "Check out my new favorite shopping app! Come and join me on Versi"
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
        self.present(activityViewController, animated: true, completion: nil)
    }
}

extension AccountVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(section == 0) {
            
            return group1.count
        }
        else {
            return group2.count
        }
       
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = logTableView.dequeueReusableCell(withIdentifier: "AccountCell") as? AccountCell else { return UITableViewCell() }
        var cat = group1[indexPath.row]
        switch indexPath.section{
            case 1:
                cat = group2[indexPath.row]
            default:
                cat = group1[indexPath.row]
        }
        cell.config(title: cat.title,description: cat.description, imageUrl: cat.iconName)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 20
    }
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
                case 0:
                    let vc = STORYBOARD.instantiateViewController(withIdentifier: CONTACT) as! ContactusVC
                    navigationController?.pushViewController(vc, animated: true)
                case 1:
                    let vc = STORYBOARD.instantiateViewController(withIdentifier: HELP) as! HelpVC
                    navigationController?.pushViewController(vc, animated: true)
                case 2:
                    let vc = STORYBOARD.instantiateViewController(withIdentifier: WISHLIST) as! WishlistVC
                    navigationController?.pushViewController(vc, animated: true)
                case 3:
                    self.shareApp()
                default:
                    let vc = STORYBOARD.instantiateViewController(withIdentifier: ADDRESSES) as! AddressesVC
                    navigationController?.pushViewController(vc, animated: true)
            }
        case 1:
            switch indexPath.row {
            case 0:
                let vc = STORYBOARD.instantiateViewController(withIdentifier: PROFILEDETAILS) as! ProfileDetailsVC
                navigationController?.pushViewController(vc, animated: true)
            case 1:
                let vc = STORYBOARD.instantiateViewController(withIdentifier: SCAN) as! ScanVC
                navigationController?.pushViewController(vc, animated: true)
            case 3:
                let vc = STORYBOARD.instantiateViewController(withIdentifier: ADDRESSES) as! AddressesVC
                navigationController?.pushViewController(vc, animated: true)
            case 2:
                let vc = STORYBOARD.instantiateViewController(withIdentifier: CREDITS) as! CreditsVC
                navigationController?.pushViewController(vc, animated: true)
            default:
                let vc = STORYBOARD.instantiateViewController(withIdentifier: ADDRESSES) as! AddressesVC
                navigationController?.pushViewController(vc, animated: true)
            }
        default:
            let vc = STORYBOARD.instantiateViewController(withIdentifier: ADDRESSES) as! AddressesVC
            navigationController?.pushViewController(vc, animated: true)
        }
        

    }

}
