//
//  Profile.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 5/14/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import Foundation

class Profile {
    
    static let instance = Profile()
    
    public private(set) var full_name: String?
    public private(set) var email: String?
    public private(set) var dob: String?
    public private(set) var mobile_number: String?
    public private(set) var gender: String?
    
    func init() {
        
    }
    
    func init(full_name: String, email: String, dob: String, mobile_number: String, gender: String) {
        self.full_name = full_name
        self.email = email
        self.dob = dob
        self.mobile_number = mobile_number
        self.gender = gender
    }
    
}
