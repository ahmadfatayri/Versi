//
//  Address.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 5/21/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import Foundation
import UIKit

class Address {
    
    public private(set) var id: String?
    public private(set) var name: String?
    public private(set) var mobile: String?
    public private(set) var pin_code: String?
    public private(set) var state: String?
    public private(set) var address_details: String?
    public private(set) var town: String?
    public private(set) var city: String?
    public private(set) var is_home: Bool?
    public private(set) var is_default: Bool?
    
    init() {
        
    }
    
    init(id: String, name: String, mobile: String, pin_code: String, state: String, address_details: String, town: String, city:String, is_home: Bool, is_default: Bool) {
        self.id = id
        self.name = name
        self.mobile = mobile
        self.pin_code = pin_code
        self.state = state
        self.address_details = address_details
        self.town = town
        self.city = city
        self.is_home = is_home
        self.is_default = is_default
    }
    
}
