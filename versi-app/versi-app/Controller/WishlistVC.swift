//
//  WishlistVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/9/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class WishlistVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var image: UIImageView!
    
    var products: [Product]?
    var refreshControl: UIRefreshControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WishlistService.instance.loadData(completion:  {data in
            self.products = data
            self.tableView.delegate = self as UITableViewDelegate
            self.tableView.dataSource = self as UITableViewDataSource
            self.tableView.reloadData()
            if data.count > 0 {
                self.image.isHidden = true
                self.tableView.isHidden = false
            }
        })
        
        addRefreshControl()
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func addToCart(_ sender: UIButton){ //<- needs `@objc`
        let vc = STORYBOARD.instantiateViewController(withIdentifier: PRODUCTVARIANTS) as! ProductVariantsVC
        vc.product = self.products![sender.tag]
        //set anitmation for navigation
        let transition:CATransition = CATransition()
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromTop
        self.navigationController!.view.layer.add(transition, forKey: kCATransition)
        
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    
    @objc func removeFromWishlist(_ sender: UIButton){ //<- needs `@objc`
        WishlistService.instance.removeData(product_id: self.products![sender.tag].uid! ){ (success) in
            if success {
                self.products?.remove(at: sender.tag)
                self.tableView.reloadData()
                if (self.products?.count)! <= 0 {
                    self.image.isHidden = false
                    self.tableView.isHidden = true
                }
                else {
                    self.image.isHidden = true
                    self.tableView.isHidden = false
                }
            }
            else {
                
            }
        }
    
    }
    
    
    func addRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = #colorLiteral(red: 0.9245222211, green: 0.2878485918, blue: 0.1882302463, alpha: 0.85)
        refreshControl?.addTarget(self, action: #selector(refreshList), for: .valueChanged)
        tableView.addSubview(refreshControl!)
    }
    
    @objc func refreshList() {
        WishlistService.instance.loadData(completion:  {data in
            self.products = data
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
            if data.count > 0 {
                self.image.isHidden = true
                self.tableView.isHidden = false
            }
            else {
                self.image.isHidden = false
                self.tableView.isHidden = true
            }
        })
    }
    
    
}


extension WishlistVC: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = tableView.dequeueReusableCell(withIdentifier: "WishlistTableCell", for: indexPath) as! WishlistTableCell
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        if let cell = cell as? WishlistTableCell {
            cell.collectionView.dataSource = self
            cell.collectionView.delegate = self
            cell.collectionView.reloadData()
            cell.collectionView.isScrollEnabled = false
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt
        indexPath: IndexPath) -> CGFloat
    {
        return tableView.bounds.width + 300.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        print("section: \(indexPath.section)")
        //        print("row: \(indexPath.row)")
        
    }
}

extension WishlistVC : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.products?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WishlistCollectionCell", for: indexPath) as! WishlistCollectionCell
    
        cell.product = self.products?[indexPath.item]
        cell.addToCartBtn.tag = indexPath.item
        cell.removeBtn.tag = indexPath.item
        cell.addToCartBtn.addTarget(self, action: #selector(self.addToCart(_:)), for: .touchUpInside)
        cell.removeBtn.addTarget(self, action: #selector(self.removeFromWishlist(_:)), for: .touchUpInside)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 5.0
        layout.minimumInteritemSpacing = 2.5

        let numberOfItemsPerRow: CGFloat = 2.0
        let itemWidth = (collectionView.bounds.width - layout.minimumLineSpacing) / numberOfItemsPerRow

        return CGSize(width: itemWidth, height: itemWidth * 1.8)
    }
    
}
