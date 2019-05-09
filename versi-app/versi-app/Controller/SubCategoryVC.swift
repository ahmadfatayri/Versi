//
//  SubCategoryVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/12/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class SubCategoryVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var category_id: String?
    var subCategories: [SubCategory] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SubCategoryService.instance.loadData(id: category_id!, completion:  {data in
            self.subCategories = data
            self.collectionView.reloadData()
        })
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
extension SubCategoryVC : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.subCategories.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubCategoryCollectionCell", for: indexPath) as! SubCategoryCollectionCell
        
        cell.subCategory = self.subCategories[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = STORYBOARD.instantiateViewController(withIdentifier: SUBSUBCATEGORY) as! SubSubCatVC
        vc.subcategory_id = "\(self.subCategories[indexPath.row].id)"
        navigationController?.pushViewController(vc, animated: true)
    }
   
}
