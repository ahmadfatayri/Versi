//
//  Product.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/5/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class Product
{
    public private(set) var uid: String?
    public private(set) var name: String?
    public private(set) var images: [UIImage]?
    public private(set) var price: Double?
    public private(set) var description: String?
    public private(set) var detail: String?
    
    init(uid: String, name: String, images: [UIImage], price: Double, description: String, detail: String)
    {
        self.uid = uid
        self.name = name
        self.images = images
        self.price = price
        self.description = description
        self.detail = detail
    }
    
  
}


