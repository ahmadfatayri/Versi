//
//  CartServices.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 5/9/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CartService {
    
    static let instance = CartService()
    
    func loadData(completion:@escaping (_ cart:[Product])->Void) {
        if let token = KeychainService.loadKey(service: SERVICEKEY, account: ACCOUNTKEY) {
            let header = [
                "Content-Type": "application/json; charset=utf-8",
                "x-access-token": token
            ]
            let id = KeychainService.loadKey(service: SERVICEID, account: ACCOUNTID)
            let body: [String: Any] = [
                "user_id": id as Any
            ]
            
            Alamofire.request(URL_CART_GET, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
                
                if response.result.error == nil {
                    let statusCode = response.response?.statusCode
                    if  statusCode == 200 {
                        var products: [Product] = []
                        
                        
                        guard let data = response.data else { return }
                        let json = try? JSON(data: data)
                        //let imagesJson = try? json?.arrayObject!["images"]
                        for (_,subJson):(String, JSON) in json! {
                            for (_,res):(String, JSON) in subJson["Product"] {
                                
                                var productImages = [String]()
                                for (_,subSubJson):(String, JSON) in res["images"] {
                                    productImages.append(subSubJson["url"].stringValue)
                                }
                                
                                var colors = Dictionary<String, String>()
                                for (_,subSubJson):(String, JSON) in subJson["colors"] {
                                    colors.updateValue(subSubJson["value"].stringValue, forKey: subSubJson["name"].stringValue)
                                    //colors.append(subSubJson["name"].stringValue, subSubJson["value"].stringValue)
                                }
                                
                                var sizes = [String]()
                                for (_,subSubJson):(String, JSON) in res["sizes"] {
                                    sizes.append(subSubJson["name"].stringValue)
                                }
                                
                                let p = Product(uid: res["id"].stringValue, name: res["name"].stringValue, images: productImages, price: res["price"].doubleValue, description: res["description"].stringValue, detail: res["detail"].stringValue, type: res["type"].stringValue, brand: res["brand"].stringValue, qr_code: res["qr_code"].stringValue, colors:colors, sizes: sizes, shipping: res["shipping"].intValue, weight: res["weight"].intValue, width: res["width"].intValue, height: res["height"].intValue, isPaid: res["isPaid"].boolValue, availability: res["availability"].intValue,
                                                isLiked: res["isLiked"].boolValue, isAddedToBasket: false)
                                
                                products.append(p)
                            }
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
    
    
    func removeData(product_id: String, completion: @escaping CompletionHandler) {
        if let token = KeychainService.loadKey(service: SERVICEKEY, account: ACCOUNTKEY) {
            let header = [
                "Content-Type": "application/json; charset=utf-8",
                "x-access-token": token
            ]
            let id = KeychainService.loadKey(service: SERVICEID, account: ACCOUNTID)
            let body: [String: Any] = [
                "user_id": id as Any,
                "product_id": product_id
            ]
            
            Alamofire.request(URL_CART_REMOVE, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
                
                if response.result.error == nil {
                    let statusCode = response.response?.statusCode
                    if  statusCode == 200 {
                        
                        completion(true)
                    }
                    else {
                        completion(false)
                    }
                } else {
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
            }
        }
    }
    
    func addData(product_id: String,qty: String, color: String, size: String, completion: @escaping CompletionHandler) {
        if let token = KeychainService.loadKey(service: SERVICEKEY, account: ACCOUNTKEY) {
            let header = [
                "Content-Type": "application/json; charset=utf-8",
                "x-access-token": token
            ]
            let id = KeychainService.loadKey(service: SERVICEID, account: ACCOUNTID)
            let body: [String: Any] = [
                "user_id": id as Any,
                "product_id": product_id,
                "comments": "",
                "qty": qty,
                "color": color,
                "size": size
            ]
            
            Alamofire.request(URL_CART_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
                
                if response.result.error == nil {
                    let statusCode = response.response?.statusCode
                    if  statusCode == 200 {
                        
                        completion(true)
                    }
                    else {
                        completion(false)
                    }
                } else {
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
            }
        }
    }
}
