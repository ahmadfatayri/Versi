//
//  AdressService.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 5/21/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AddressService {
    
    static let instance = AddressService()
    
    func loadData(completion:@escaping (_ addresses: [Address])->Void) {
        if let token = KeychainService.loadKey(service: SERVICEKEY, account: ACCOUNTKEY) {
            let header = [
                "Content-Type": "application/json; charset=utf-8",
                "x-access-token": token
            ]
            let id = KeychainService.loadKey(service: SERVICEID, account: ACCOUNTID)
            let body: [String: Any] = [
                "user_id": id as Any
            ]
            
            Alamofire.request(URL_ADDRESS_GET , method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
                if response.result.error == nil {
                    let statusCode = response.response?.statusCode
                    if  statusCode == 200 {
                        var addresses: [Address] = []
                        
                        guard let data = response.data else { return }
                        let json = try? JSON(data: data)
                        for (_,subJson):(String, JSON) in json! {
                            let address = Address(id: subJson["_id"].stringValue, name: subJson["name"].stringValue, mobile: subJson["mobile"].stringValue, pin_code: subJson["pin_code"].stringValue, state: subJson["state"].stringValue, address_details: subJson["address_details"].stringValue, town: subJson["town"].stringValue, city: subJson["city"].stringValue, is_home: subJson["is_home"].boolValue, is_default: subJson["is_default"].boolValue)
                            addresses.append(address)
                        }
                        completion(addresses)
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
            Alamofire.request(URL_ADDRESS_REMOVE + id , method: .delete, encoding: JSONEncoding.default, headers: header).responseString { (response) in
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
    
    func addData(name: String, mobile: String, pin_code: String, state: String, address_details: String, town:String, city: String, is_home: Bool, is_default: Bool, completion: @escaping CompletionHandler) {
        if let token = KeychainService.loadKey(service: SERVICEKEY, account: ACCOUNTKEY) {
            let header = [
                "Content-Type": "application/json; charset=utf-8",
                "x-access-token": token
            ]
            let id = KeychainService.loadKey(service: SERVICEID, account: ACCOUNTID)
            let body: [String: Any] = [
                "user_id": id as Any,
                "name": name,
                "mobile": mobile,
                "pin_code": pin_code,
                "state": state,
                "address_details": address_details,
                "town": town,
                "city": city,
                "is_home": is_home,
                "is_default": is_default,
            ]
            Alamofire.request(URL_ADDRESS_ADD , method: .post, parameters: body,encoding: JSONEncoding.default, headers: header).responseString { (response) in
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
