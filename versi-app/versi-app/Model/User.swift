//
//  User.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/11/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import Foundation

class User {
    
    static let instance = User()
    
    public private(set) var id = ""
    public private(set) var email = ""
    public private(set) var name = ""
    public private(set) var gender = ""
    
    func setUserData(id: String, email: String, name: String, gender: String) {
        self.id = id
        self.email = email
        self.name = name
        self.gender = gender
    }
    
}
