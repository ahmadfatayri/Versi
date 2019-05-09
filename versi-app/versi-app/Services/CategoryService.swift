//
//  CategoryService.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/11/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CategoryService {
    
    static let instance = CategoryService()
    
    func loadData(completion:@escaping (_ categories:[CategoryModel])->Void) {
        if let token = KeychainService.loadKey(service: SERVICEKEY, account: ACCOUNTKEY) {
            let header = [
                "Content-Type": "application/json; charset=utf-8",
                "x-access-token": token
            ]
        Alamofire.request(URL_GET_CATEGORIES, method: .get, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            
            if response.result.error == nil {
                let statusCode = response.response?.statusCode
                if  statusCode == 200 {
                    var categories: [CategoryModel] = []
                    
                    
                    guard let data = response.data else { return }
                    let json = try? JSON(data: data)
                    
                    for (_,subJson):(String, JSON) in json! {
                        let cat = CategoryModel()
                        cat.config(id: subJson["_id"].stringValue, title: subJson["title"].stringValue, description: subJson["description"].stringValue, imageUrl: subJson["image"].stringValue)
                        
                        categories.append(cat)
                    }
                    
                    
                    completion(categories)
                }
                else {
                    completion([])
                }
            } else {
                completion([])
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    }
}
