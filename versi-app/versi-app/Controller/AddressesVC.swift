//
//  AddressesVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/8/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class AddressesVC: UIViewController {

    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var addAddressBtn: UIButton!
    @IBOutlet weak var viewDetails: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    
    var addresses: [Address]?
    var refreshControl: UIRefreshControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AddressService.instance.loadData(completion:  {data in
            if data.count > 0 {
                self.addresses = data
                self.tableView.reloadData()
                self.setHiddenItems()
            }
            else {
                self.setVisibleItems()
            }
        })
        tableView.delegate = self as UITableViewDelegate
        tableView.dataSource = self as UITableViewDataSource
        self.tableView.separatorStyle = .none
        
        addRefreshControl()
        
    }
    
    func setHiddenItems() {
        self.tableView.isHidden = false
        self.addAddressBtn.isHidden = false
        self.viewDetails.isHidden = true
    }
    
    func setVisibleItems() {
        self.tableView.isHidden = true
        self.addAddressBtn.isHidden = true
        self.viewDetails.isHidden = false
    }
    
    func addRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = #colorLiteral(red: 0.9245222211, green: 0.2878485918, blue: 0.1882302463, alpha: 0.85)
        refreshControl?.addTarget(self, action: #selector(refreshList), for: .valueChanged)
        tableView.addSubview(refreshControl!)
    }
    
    @objc func refreshList() {
        AddressService.instance.loadData(completion:  {data in
            self.addresses = data
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        })
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addAddressbtnPressed(_ sender: Any) {
        let vc = STORYBOARD.instantiateViewController(withIdentifier: ADDADDRESS) as! AddAddressVC
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func addAddressBtn2Pressed(_ sender: Any) {
        let vc = STORYBOARD.instantiateViewController(withIdentifier: ADDADDRESS) as! AddAddressVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func removeCard(atIndexPath indexPath: IndexPath) {
        AddressService.instance.removeData(id: addresses![indexPath.row].id! ) { (success) in
            if success {
                self.alert(message: "Address remove successfully!")
            }
            else {
                self.alert(message: "Couldn't remove the address!")
            }
        }
        self.addresses?.remove(at: indexPath.row)
        if (self.addresses?.count)! > 0 {
            self.setHiddenItems()
        }
        else {
            self.setVisibleItems()
        }
    }
    
}

extension AddressesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let addresses = addresses {
            return addresses.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddressCell") as? AddressCell else { return UITableViewCell() }
        
        cell.address = self.addresses?[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.removeCard(atIndexPath: indexPath)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        
        return [deleteAction]
    }
    
    
}
