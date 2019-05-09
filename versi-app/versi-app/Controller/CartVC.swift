//
//  CartVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/25/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class CartVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var defaultView: UIStackView!
    
    var refreshControl: UIRefreshControl?
    var products: [Product]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.setNeedsLayout()

        
        CartService.instance.loadData(completion:  {data in
            self.products = data
            self.tableView.reloadData()
            if (self.products?.count)! > 0 {
                self.tableView.isHidden = false
                self.defaultView.isHidden = true
            }
        })
        
        tableView.delegate = self as UITableViewDelegate
        tableView.dataSource = self as UITableViewDataSource
        tableView.separatorStyle = .none
        
        addRefreshControl()
    }
    
    func addRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = #colorLiteral(red: 0.9245222211, green: 0.2878485918, blue: 0.1882302463, alpha: 0.85)
        refreshControl?.addTarget(self, action: #selector(refreshList), for: .valueChanged)
        tableView.addSubview(refreshControl!)
    }
    
    @objc func refreshList() {
        CartService.instance.loadData(completion:  {data in
            self.products = data
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
            if (self.products?.count)! > 0 {
                self.tableView.isHidden = false
                self.defaultView.isHidden = true
            }
            else {
                self.tableView.isHidden = true
                self.defaultView.isHidden = false
            }
        })
    }
    
    @objc func removeFromCart(_ sender: UIButton){
        CartService.instance.removeData(product_id: self.products![sender.tag].uid! ){ (success) in
            if success {
                self.products?.remove(at: sender.tag)
                self.tableView.reloadData()
                if (self.products?.count)! <= 0 {
                    self.defaultView.isHidden = false
                    self.tableView.isHidden = true
                }
                else {
                    self.defaultView.isHidden = true
                    self.tableView.isHidden = false
                }
            }
            else {
                
            }
        }
        
    }
}

extension CartVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let products = products {
            return products.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell") as? CartCell else { return UITableViewCell() }
        
        cell.product = self.products?[indexPath.row]
        cell.selectionStyle = .none
        
        cell.cartRemoveBtn.tag = indexPath.item
        cell.cartRemoveBtn.addTarget(self, action: #selector(self.removeFromCart(_:)), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = STORYBOARD.instantiateViewController(withIdentifier: PRODUCTVARIANTS) as! ProductVariantsVC
        vc.product = self.products![indexPath.row]
        //set anitmation for navigation
        let transition:CATransition = CATransition()
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromTop
        self.navigationController!.view.layer.add(transition, forKey: kCATransition)
        
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    
}
