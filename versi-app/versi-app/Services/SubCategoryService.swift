//
//  SubCategoryService.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 5/8/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class SubCategoryService {
    
    static let instance = SubCategoryService()
    
    func loadData(id: String ,completion:@escaping (_ categories:[SubCategory])->Void) {
        if let token = KeychainService.loadKey(service: SERVICEKEY, account: ACCOUNTKEY) {
            
            let header = [
                "Content-Type": "application/json; charset=utf-8",
                "x-access-token": token
            ]
            
            let body: [String: Any] = [
                "category_id": id
            ]
            
            Alamofire.request(URL_GET_SUB_CATEGORIES, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
                
                if response.result.error == nil {
                    let statusCode = response.response?.statusCode
                    if  statusCode == 200 {
                        var subCategory: [SubCategory] = []
                        
                        
                        guard let data = response.data else { return }
                        let json = try? JSON(data: data)
                        
                        for (_,subJson):(String, JSON) in json! {
                            let subcat = SubCategory()
                            subcat.config(id: subJson["_id"].stringValue, title: subJson["title"].stringValue, image: subJson["image"].stringValue, category_id: subJson["category_id"].stringValue)
                            
                            subCategory.append(subcat)
                        }
                        
                        
                        completion(subCategory)
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
