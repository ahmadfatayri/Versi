//
//  CreditsVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/12/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class CreditsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewImage: UIStackView!
    @IBOutlet weak var addNewCreditBtn: UIButton!
    @IBOutlet weak var addCardBtn: UIButton!
    
    var cards: [Card]?
    var refreshControl: UIRefreshControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CardService.instance.loadData(completion:  {data in
            if data.count > 0 {
                self.cards = data
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
        self.viewImage.isHidden = true
        self.addNewCreditBtn.isHidden = true
        self.addCardBtn.isHidden = false
    }
    
    func setVisibleItems() {
        self.tableView.isHidden = true
        self.viewImage.isHidden = false
        self.addNewCreditBtn.isHidden = false
        self.addCardBtn.isHidden = true
    }
    
    func addRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = #colorLiteral(red: 0.9245222211, green: 0.2878485918, blue: 0.1882302463, alpha: 0.85)
        refreshControl?.addTarget(self, action: #selector(refreshList), for: .valueChanged)
        tableView.addSubview(refreshControl!)
    }
    
    @objc func refreshList() {
        CardService.instance.loadData(completion:  {data in
            self.cards = data
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        })
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func addNewCreditBtnPressed(_ sender: Any) {
        let vc = STORYBOARD.instantiateViewController(withIdentifier: ADDCREDITS) as! AddCreditVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func removeCard(atIndexPath indexPath: IndexPath) {
        CardService.instance.removeData(id: cards![indexPath.row].id! ) { (success) in
            if success {
                self.alert(message: "Card remove successfully!")
            }
            else {
                self.alert(message: "Couldn't remove the card!")
            }
        }
        self.cards?.remove(at: indexPath.row)
        if (self.cards?.count)! > 0 {
            self.setHiddenItems()
        }
        else {
            self.setVisibleItems()
        }
    }
    @IBAction func addCardBtnPressed(_ sender: Any) {
        let vc = STORYBOARD.instantiateViewController(withIdentifier: ADDCREDITS) as! AddCreditVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension CreditsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let cards = cards {
            return cards.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell") as? CardCell else { return UITableViewCell() }
        
        cell.card = self.cards?[indexPath.row]
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
