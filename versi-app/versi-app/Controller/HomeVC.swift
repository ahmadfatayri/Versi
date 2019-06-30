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
    @IBOutlet weak var titleLbl: UILabel!
    
    var products: [Product]?
    var refreshControl: UIRefreshControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productsTableView.delegate = self as UITableViewDelegate
        productsTableView.dataSource = self as UITableViewDataSource
        
        addRefreshControl()
        titleLbl.text = self.getByTagName(key: "appTitle")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ProductsService.instance.loadData(completion:  {data in
            WishlistService.instance.loadData(completion: {dataLiked in
                for product in data{
                    for likedProduct in dataLiked {
                        if likedProduct.uid == product.uid {
                            product.isLiked = true
                        }
                    }
                }
                self.products = data
                self.productsTableView.reloadData()
                CartService.instance.loadData(completion: { dataCart in
                    for product in data{
                        for cartProduct in dataCart {
                            if cartProduct.uid == product.uid {
                                product.isAddedToBasket = true
                            }
                        }
                    }
                })
            })
        })
    }
    func addRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = #colorLiteral(red: 0.9245222211, green: 0.2878485918, blue: 0.1882302463, alpha: 0.85)
        refreshControl?.addTarget(self, action: #selector(refreshList), for: .valueChanged)
        productsTableView.addSubview(refreshControl!)
    }
    
    @objc func refreshList() {
        ProductsService.instance.loadData(completion:  {data in
            WishlistService.instance.loadData(completion: {dataLiked in
                for product in data{
                    for likedProduct in dataLiked {
                        if likedProduct.uid == product.uid {
                            product.isLiked = true
                        }
                    }
                }
                self.products = data
                self.productsTableView.reloadData()
                self.refreshControl?.endRefreshing()
            })
        })
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
