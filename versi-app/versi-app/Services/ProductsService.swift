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
        if let token = KeychainService.loadKey(service: SERVICEKEY, account: ACCOUNTKEY) {
            let header = [
                "Content-Type": "application/json; charset=utf-8",
                "x-access-token": token
            ]
            Alamofire.request(URL_PRODUCTS, method: .get, encoding: JSONEncoding.default, headers: header).responseString { (response) in
                
                if response.result.error == nil {
                    let statusCode = response.response?.statusCode
                    if  statusCode == 200 {
                        var products: [Product] = []
                        
                        
                        guard let data = response.data else { return }
                        let json = try? JSON(data: data)
                        //let imagesJson = try? json?.arrayObject!["images"]
                        
                        for (_,subJson):(String, JSON) in json! {
                            
                            var productImages = [String]()
                            for (_,subSubJson):(String, JSON) in subJson["images"] {
                                productImages.append(subSubJson["url"].stringValue)
                            }
                            
                            var colors = [String]()
                            for (_,subSubJson):(String, JSON) in subJson["colors"] {
                                colors.append(subSubJson["name"].stringValue)
                            }
                            
                            var sizes = [String]()
                            for (_,subSubJson):(String, JSON) in subJson["sizes"] {
                                sizes.append(subSubJson["name"].stringValue)
                            }
                            
                            
                            let p = Product(uid: subJson["id"].stringValue, name: subJson["name"].stringValue, images: productImages, price: subJson["price"].doubleValue, description: subJson["description"].stringValue, detail: subJson["detail"].stringValue, type: subJson["type"].stringValue, brand: subJson["brand"].stringValue, qr_code: subJson["qr_code"].stringValue, colors:colors, sizes: sizes, shipping: subJson["shipping"].intValue, weight: subJson["weight"].intValue, width: subJson["width"].intValue, height: subJson["height"].intValue, isPaid: subJson["isPaid"].boolValue, availability: subJson["availability"].intValue,
                                            isLiked: subJson["isLiked"].boolValue)
                            
                            products.append(p)
                        }
                        
                        
                        completion(products)
                    }
                    else{
                        completion([])
                    }
                } else {
                    completion([])
                    debugPrint(response.result.error as Any)
                }
            }
        }
        
        
        
    }
    
    func loadDataWithFilter(subCategory: String ,completion:@escaping (_ categories:[Product])->Void) {
        if let token = KeychainService.loadKey(service: SERVICEKEY, account: ACCOUNTKEY) {
            
            let header = [
                "Content-Type": "application/json; charset=utf-8",
                "x-access-token": token
            ]
            let body: [String: Any] = [
                "sub_category_id": subCategory
            ]
            
            Alamofire.request(URL_PRODUCTS_FILTERS, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
                
                if response.result.error == nil {
                    let statusCode = response.response?.statusCode
                    if  statusCode == 200 {
                        var products: [Product] = []
                        
                        
                        guard let data = response.data else { return }
                        let json = try? JSON(data: data)
                        //let imagesJson = try? json?.arrayObject!["images"]
                        
                        for (_,subJson):(String, JSON) in json! {
                            
                            var productImages = [String]()
                            for (_,subSubJson):(String, JSON) in subJson["images"] {
                                productImages.append(subSubJson["url"].stringValue)
                            }
                            
                            var colors = [String]()
                            for (_,subSubJson):(String, JSON) in subJson["colors"] {
                                colors.append(subSubJson["name"].stringValue)
                            }
                            
                            var sizes = [String]()
                            for (_,subSubJson):(String, JSON) in subJson["sizes"] {
                                sizes.append(subSubJson["name"].stringValue)
                            }
                            
                            
                            let p = Product(uid: subJson["id"].stringValue, name: subJson["name"].stringValue, images: productImages, price: subJson["price"].doubleValue, description: subJson["description"].stringValue, detail: subJson["detail"].stringValue, type: subJson["type"].stringValue, brand: subJson["brand"].stringValue, qr_code: subJson["qr_code"].stringValue, colors:colors, sizes: sizes, shipping: subJson["shipping"].intValue, weight: subJson["weight"].intValue, width: subJson["width"].intValue, height: subJson["height"].intValue, isPaid: subJson["isPaid"].boolValue, availability: subJson["availability"].intValue,
                                            isLiked: subJson["isLiked"].boolValue)
                            
                            products.append(p)
                        }
                        
                        
                        completion(products)
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
    
    
    func loadSingleData(productId: String ,completion:@escaping (_ products:Product)->Void) {
        if let token = KeychainService.loadKey(service: SERVICEKEY, account: ACCOUNTKEY) {
            
            let header = [
                "Content-Type": "application/json; charset=utf-8",
                "x-access-token": token
            ]
            
            Alamofire.request(URL_FIND_PRODUCT + productId, method: .get, encoding: JSONEncoding.default, headers: header).responseString { (response) in
               
                if response.result.error == nil {
                    let statusCode = response.response?.statusCode
                    if  statusCode == 200 {
                        
                        guard let data = response.data else { return }
                        let json = try? JSON(data: data)
                        //let imagesJson = try? json?.arrayObject!["images"]
                        
                        
                            var productImages = [String]()
                        for (_,subJson):(String, JSON) in json!["images"] {
                                productImages.append(subJson["url"].stringValue)
                            }
                        
                            var colors = [String]()
                        for (_,subJson):(String, JSON) in json!["colors"] {
                                colors.append(subJson["name"].stringValue)
                            }
                        
                            var sizes = [String]()
                        for (_,subJson):(String, JSON) in json!["sizes"] {
                                sizes.append(subJson["name"].stringValue)
                            }
                        
                            
                        let p = Product(uid: json!["id"].stringValue, name: json!["name"].stringValue, images: productImages, price: json!["price"].doubleValue, description: json!["description"].stringValue, detail: json!["detail"].stringValue, type: json!["type"].stringValue, brand: json!["brand"].stringValue, qr_code: json!["qr_code"].stringValue, colors:colors, sizes: sizes, shipping: json!["shipping"].intValue, weight: json!["weight"].intValue, width: json!["width"].intValue, height: json!["height"].intValue, isPaid: json!["isPaid"].boolValue, availability: json!["availability"].intValue,isLiked: json!["isLiked"].boolValue)
                            
                        
                        
                        
                        completion(p)
                    }
                    else {
                        completion(Product())
                    }
                } else {
                    completion(Product())
                    debugPrint(response.result.error as Any)
                }
            }
        }
        
        
        
    }
    
}
