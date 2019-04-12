//
//  CategoryVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/4/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class CategoryVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var categories: [CategoryModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CategoryService.instance.loadData(completion:  {data in
            self.categories = data
            self.tableview.reloadData()
        })
        
        self.tableview.delegate = self as UITableViewDelegate
        self.tableview.dataSource = self as UITableViewDataSource
        
    }
}


extension CategoryVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell else { return UITableViewCell() }
        let cat = categories[indexPath.row]
        cell.config(title: cat.title,description: cat.description, bgCategory: cat.imageUrl)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("section: \(indexPath.section)")
//        print("row: \(indexPath.row)")
        
        let vc = STORYBOARD.instantiateViewController(withIdentifier: SUBCATEGORY) as! SubCategoryVC
        vc.subCategories = self.categories[indexPath.row].subCategories
        navigationController?.pushViewController(vc, animated: true)
    }

}



