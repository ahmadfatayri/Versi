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
        loadData()
        tableview.delegate = self as UITableViewDelegate
        tableview.dataSource = self as UITableViewDataSource
    }
    
    func loadData() {
        let cat1 = CategoryModel()
        cat1.config(id: "1", title: "WOMEN", description: "TKurtas & Suits, Top & Tees, Dresses,...", imageUrl: "bg (2)")
        let cat2 = CategoryModel()
        cat2.config(id: "2", title: "MEN", description: "T-Shirts, Shirts, Jeans, Shoes, Access...", imageUrl: "bg (1)")
        let cat3 = CategoryModel()
        cat3.config(id: "3", title: "KIDS", description: "Brands, Clothing, Footwear, Accesso...", imageUrl: "bg (3)")
        let cat4 = CategoryModel()
        cat4.config(id: "4", title: "HOME", description: "Bedsheets, Blankets, Towels, Curtai...", imageUrl: "bg (2)")
        let cat5 = CategoryModel()
        cat5.config(id: "5", title: "GADGETS", description: "Head phones, Smart wearables, Ruc...", imageUrl: "bg (1)")
        categories.append(cat1)
        categories.append(cat2)
        categories.append(cat3)
        categories.append(cat4)
        categories.append(cat5)
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
    }

}



