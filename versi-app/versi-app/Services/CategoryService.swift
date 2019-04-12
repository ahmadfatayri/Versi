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
        
        Alamofire.request(URL_CATEGORIES, method: .get, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            
            if response.result.error == nil {
                
                var categories: [CategoryModel] = []
                
                
                guard let data = response.data else { return }
                let json = try? JSON(data: data)
                
                for (_,subJson):(String, JSON) in json! {
                    
                    
                    var subCategories = [SubCategory]()
                    for (_,subSubJson):(String, JSON) in subJson["sub_category"] {
                        let subCat = SubCategory()
                        subCat.config(id: subSubJson["id"].intValue, title: subSubJson["title"].stringValue, image: UIImage(named: subSubJson["image"].stringValue)!)
                        subCategories.append(subCat)
                    }
                    
                    
                    let cat = CategoryModel()
                    cat.config(id: subJson["id"].stringValue, title: subJson["title"].stringValue, description: subJson["description"].stringValue, imageUrl: subJson["image"].stringValue, subCategories: subCategories)
                    
                    categories.append(cat)
                }
                
                
                completion(categories)
            } else {
                completion([])
                debugPrint(response.result.error as Any)
            }
        }
    }
    
}
