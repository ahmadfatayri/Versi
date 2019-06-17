//
//  Card.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 5/20/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import Foundation
import UIKit

class Card {
    
    public private(set) var id: String?
    public private(set) var name: String?
    public private(set) var number: String?
    public private(set) var cvc: String?
    public private(set) var expire_date: String?
    
    init() {
        
    }
    
    init(id: String, name: String, number: String, cvc: String, expire_date: String) {
        self.id = id
        self.name = name
        self.number = number
        self.cvc = cvc
        self.expire_date = expire_date
    }
    
}
