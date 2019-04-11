//
//  ProductsServices.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/11/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ProductsService {
    
    static let instance = ProductsService()
    
    func loadData(completion:@escaping (_ categories:[Product])->Void) {
        
        Alamofire.request(URL_PRODUCTS, method: .get, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            
            if response.result.error == nil {
                
                var products: [Product] = []
                
                
                guard let data = response.data else { return }
                let json = try? JSON(data: data)
                //let imagesJson = try? json?.arrayObject!["images"]
                
                for (_,subJson):(String, JSON) in json! {
                    
                    var productImages = [UIImage]()
                    for (_,subSubJson):(String, JSON) in subJson["images"] {
                        productImages.append(UIImage(named: subSubJson["name"].stringValue)!)
                    }
                    
                    
                    let p = Product(uid: subJson["id"].stringValue, name: subJson["name"].stringValue, images: productImages, price: subJson["price"].doubleValue, description: subJson["description"].stringValue, detail: subJson["detail"].stringValue)
                    
                    products.append(p)
                }
                
                
                completion(products)
            } else {
                completion([])
                debugPrint(response.result.error as Any)
            }
        }
    }
    
}
