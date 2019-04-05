//
//  AccountVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/4/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class AccountVC: UIViewController {

    @IBOutlet weak var logoutBtn: borderButton!
    @IBOutlet weak var logTableView: UITableView!
    @IBOutlet weak var detailsTableView: UITableView!
    
    /// A simple data structure to populate the table view.
    struct PreviewDetail {
        let title: String
        let navigationNext: String
    }
    
    let sampleData = [
        PreviewDetail(title: "Small", navigationNext: "160.0"),
        PreviewDetail(title: "Medium", navigationNext: "320.0"),
        PreviewDetail(title: "Large", navigationNext: "0.0")
    ]
    
    let sampleData1 = [
        PreviewDetail(title: "One", navigationNext: "160.0"),
        PreviewDetail(title: "Two", navigationNext: "320.0"),
        PreviewDetail(title: "Three", navigationNext: "0.0"),
        PreviewDetail(title: "More", navigationNext: "0.0")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        logTableView.delegate = self as UITableViewDelegate
//        logTableView.dataSource = self as UITableViewDataSource
//
//        detailsTableView.delegate = self as UITableViewDelegate
//        detailsTableView.dataSource = self as UITableViewDataSource
    }
    
    
}
//
//extension AccountVC: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//
//}
