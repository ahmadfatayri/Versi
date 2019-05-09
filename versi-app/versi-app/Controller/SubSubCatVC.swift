//
//  SubSubCatVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/12/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class SubSubCatVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var subcategory_id: String?
    var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProductsService.instance.loadDataWithFilter(subCategory: subcategory_id! ,completion:  {data in
            self.products = data
            self.collectionView.dataSource = self
            self.collectionView.delegate = self
           // self.collectionView.reloadData()
        })

        
    }
    
    
    @IBAction func backBtnPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension SubSubCatVC : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.products.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubSubCatCollectionCell", for: indexPath) as! SubSubCatCollectionCell
        
        cell.product = self.products[indexPath.item]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedProduct = products[indexPath.row]
        let vc = STORYBOARD.instantiateViewController(withIdentifier: PRODUCTDETAILS) as! ProductDetailTableViewController
        vc.product = selectedProduct
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 2.5
        layout.minimumInteritemSpacing = 2.5

        let numberOfItemsPerRow: CGFloat = 2.0
        let itemWidth = (collectionView.bounds.width - layout.minimumLineSpacing) / numberOfItemsPerRow

        return CGSize(width: itemWidth, height: itemWidth * 1.3)
    }
    
}
