//
//  HomeVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/5/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var productsTableView: UITableView!
    
    var products: [Product]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProductsService.instance.loadData(completion:  {data in
            self.products = data
            self.productsTableView.reloadData()
        })
        
//        productsTableView.estimatedRowHeight = productsTableView.rowHeight
//        productsTableView.rowHeight = UITableView.automaticDimension
//
        productsTableView.delegate = self as UITableViewDelegate
        productsTableView.dataSource = self as UITableViewDataSource

    }
    
    
}


extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let products = products {
            return products.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = productsTableView.dequeueReusableCell(withIdentifier: "ProductCell") as? ProductCell else { return UITableViewCell() }
        
        cell.product = self.products?[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let selectedProduct = products?[indexPath.row]
        let vc = STORYBOARD.instantiateViewController(withIdentifier: PRODUCTDETAILS) as! ProductDetailTableViewController
        vc.product = selectedProduct
        navigationController?.pushViewController(vc, animated: true)
      
        
    }
    
}
