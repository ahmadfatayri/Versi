//
//  AuthService.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/11/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import CommonCrypto

class AuthService {
    
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn : Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    
   
    
    func registerUser(email: String, password: String, name: String, phone: String, gender: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        let encPassword = ccSha256(data: password.data(using: .utf8)!)
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": encPassword.map { String(format: "%02hhx", $0) }.joined(),
            "phone": phone,
            "full_name": name,
            "gender": gender,
            "role": "user"
        ]
            
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            
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
    
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        let encPassword = ccSha256(data: password.data(using: .utf8)!)

        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": encPassword.map { String(format: "%02hhx", $0) }.joined()
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                let statusCode = response.response?.statusCode
                if  statusCode == 200 {
                    guard let data = response.data else { return }
                    let json = try? JSON(data: data)
                    //self.authToken = json!["token"].stringValue
                    self.isLoggedIn = true
                    
                    let name = json!["name"].stringValue
                    let id = json!["id"].stringValue
                    let email = json!["email"].stringValue
                    
                    KeychainService.saveKey(service: SERVICEKEY, account: ACCOUNTKEY, data: json!["token"].stringValue)
                    KeychainService.saveKey(service: SERVICEID, account: ACCOUNTID, data: id)
                    
                    User.instance.setUserData(id: id, email: email, name: name, gender: "")
                    
                    let defaults = UserDefaults.standard
                    defaults.set("user", forKey: DEFAULTKEY.role)
                    
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
    
    func forgotPassword(email: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        let body: [String: Any] = [
            "email": lowerCaseEmail,
        ]
        
        Alamofire.request(URL_FORGOTPASSWORD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            
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
    
    func ccSha256(data: Data) -> Data {
        var digest = Data(count: Int(CC_SHA256_DIGEST_LENGTH))
        
        _ = digest.withUnsafeMutableBytes { (digestBytes) in
            data.withUnsafeBytes { (stringBytes) in
                CC_SHA256(stringBytes, CC_LONG(data.count), digestBytes)
            }
        }
        return digest
    }
    
    func skipLogin(email: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        let password = "123456"
        let encPassword = ccSha256(data: password.data(using: .utf8)!)
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "role": "guest",
            "password": encPassword.map { String(format: "%02hhx", $0) }.joined(),
        ]
        
        Alamofire.request(URL_SKIPLOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                let statusCode = response.response?.statusCode
                if  statusCode == 200 {
                    guard let data = response.data else { return }
                    let json = try? JSON(data: data)
                    //self.authToken = json!["token"].stringValue
                    self.isLoggedIn = true
                    
                    let name = json!["name"].stringValue
                    let id = json!["id"].stringValue
                    let email = json!["email"].stringValue
                    print(id)
                    KeychainService.removeKey(service: SERVICEKEY, account: ACCOUNTKEY)
                    KeychainService.saveKey(service: SERVICEKEY, account: ACCOUNTKEY, data: json!["token"].stringValue)
                    KeychainService.saveKey(service: SERVICEID, account: ACCOUNTID, data: id)
                    
                    User.instance.setUserData(id: id, email: email, name: name, gender: "male")
                    
                    let defaults = UserDefaults.standard
                    defaults.set("guest", forKey: DEFAULTKEY.role)
                    
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

