//
//  ContactusService.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 5/14/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class ContactusService {
    
    static let instance = ContactusService()
    
    func sendData(msg: String, completion: @escaping CompletionHandler) {
        if let token = KeychainService.loadKey(service: SERVICEKEY, account: ACCOUNTKEY) {
            let header = [
                "Content-Type": "application/json; charset=utf-8",
                "x-access-token": token
            ]
            let id = KeychainService.loadKey(service: SERVICEID, account: ACCOUNTID)
            let body: [String: Any] = [
                "user_id": id as Any,
                "message": msg
            ]
            Alamofire.request(URL_CONTACTUS, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
                
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
