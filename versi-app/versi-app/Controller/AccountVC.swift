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
    
    
}

extension AccountVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(section == 0) {
            
            return group1.count
        }
        else if(section == 1) {
            return group2.count
        }
        else {
            return group3.count
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = logTableView.dequeueReusableCell(withIdentifier: "AccountCell") as? AccountCell else { return UITableViewCell() }
        var cat = group1[indexPath.row]
        switch indexPath.section{
            case 1:
                cat = group2[indexPath.row]
            case 2:
                cat = group3[indexPath.row]
            default:
                cat = group1[indexPath.row]
        }
        cell.config(title: cat.title,description: cat.description, imageUrl: cat.iconName)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
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
                case 2:
                    let vc = STORYBOARD.instantiateViewController(withIdentifier: WISHLIST) as! WishlistVC
                    navigationController?.pushViewController(vc, animated: true)
                default:
                    let vc = STORYBOARD.instantiateViewController(withIdentifier: ADDRESSES) as! AddressesVC
                    navigationController?.pushViewController(vc, animated: true)
            }
        case 1:
            switch indexPath.row {
            case 0:
                let vc = STORYBOARD.instantiateViewController(withIdentifier: ADDRESSES) as! AddressesVC
                navigationController?.pushViewController(vc, animated: true)
            case 2:
                let vc = STORYBOARD.instantiateViewController(withIdentifier: CREDITS) as! CreditsVC
                navigationController?.pushViewController(vc, animated: true)
            default:
                let vc = STORYBOARD.instantiateViewController(withIdentifier: ADDRESSES) as! AddressesVC
                navigationController?.pushViewController(vc, animated: true)
            }
        case 2:
            switch indexPath.row {
            case 3:
                let vc = STORYBOARD.instantiateViewController(withIdentifier: ADDRESSES) as! AddressesVC
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
