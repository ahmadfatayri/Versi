//
//  CardService.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 5/20/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class CardService {
    
    static let instance = CardService()
    
    func loadData(completion:@escaping (_ cards: [Card])->Void) {
        if let token = KeychainService.loadKey(service: SERVICEKEY, account: ACCOUNTKEY) {
            let header = [
                "Content-Type": "application/json; charset=utf-8",
                "x-access-token": token
            ]
            let id = KeychainService.loadKey(service: SERVICEID, account: ACCOUNTID)
            let body: [String: Any] = [
                "user_id": id as Any
            ]
            
            Alamofire.request(URL_CARD_GET , method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
                if response.result.error == nil {
                    let statusCode = response.response?.statusCode
                    if  statusCode == 200 {
                        var cards: [Card] = []
                        
                        guard let data = response.data else { return }
                        let json = try? JSON(data: data)
                        for (_,subJson):(String, JSON) in json! {
                            let card = Card(id: subJson["_id"].stringValue,name: subJson["name"].stringValue, number: subJson["number"].stringValue, cvc: subJson["cvc"].stringValue, expire_date: subJson["expire_date"].stringValue)
                            
                            cards.append(card)
                        }
                        completion(cards)
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
    
    func removeData(id: String ,completion: @escaping CompletionHandler) {
        if let token = KeychainService.loadKey(service: SERVICEKEY, account: ACCOUNTKEY) {
            let header = [
                "Content-Type": "application/json; charset=utf-8",
                "x-access-token": token
            ]
            Alamofire.request(URL_CARD_REMOVE + id , method: .delete, encoding: JSONEncoding.default, headers: header).responseString { (response) in
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
    
    func addData(name: String, number: String, cvc: String, expire_date: String, completion: @escaping CompletionHandler) {
        if let token = KeychainService.loadKey(service: SERVICEKEY, account: ACCOUNTKEY) {
            let header = [
                "Content-Type": "application/json; charset=utf-8",
                "x-access-token": token
            ]
            let id = KeychainService.loadKey(service: SERVICEID, account: ACCOUNTID)
            let body: [String: Any] = [
                "user_id": id as Any,
                "name": name,
                "number": number,
                "cvc": cvc,
                "expire_date": expire_date
            ]
            Alamofire.request(URL_CARD_ADD , method: .post, parameters: body,encoding: JSONEncoding.default, headers: header).responseString { (response) in
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
