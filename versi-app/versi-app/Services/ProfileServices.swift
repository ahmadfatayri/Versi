//
//  ProfileServices.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 5/14/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ProfileService {
    
    static let instance = ProfileService()
    
    func loadData(completion:@escaping (_ profile: Profile)->Void) {
        if let token = KeychainService.loadKey(service: SERVICEKEY, account: ACCOUNTKEY) {
            let header = [
                "Content-Type": "application/json; charset=utf-8",
                "x-access-token": token
            ]
            let id = KeychainService.loadKey(service: SERVICEID, account: ACCOUNTID)
            Alamofire.request(URL_PROFILE + id!, method: .get, encoding: JSONEncoding.default, headers: header).responseString { (response) in
                if response.result.error == nil {
                    let statusCode = response.response?.statusCode
                    if  statusCode == 200 {
                        
                        guard let data = response.data else { return }
                        let json = try? JSON(data: data)
                        
                        //var profile: Profile
                        let p = Profile()
                       // p.init(full_name: json!["full_name"].stringValue, email: json!["email"].stringValue, dob: json!["dob"].stringValue, mobile_number: json!["mobile_number"].stringValue, gender: json!["full_name"].stringValue)
                        
                        //let profile = Profile(full_name: json!["full_name"].stringValue, email: json!["email"].stringValue, dob: json!["dob"].stringValue, mobile_number: json!["mobile_number"].stringValue, gender: json!["full_name"].stringValue)
                        
                        completion(p)
                    }
                    else {
                        completion(Profile())
                    }
                } else {
                    completion(Profile())
                    debugPrint(response.result.error as Any)
                }
            }
        }
        
    }
}
