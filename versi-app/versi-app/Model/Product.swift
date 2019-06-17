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
    public private(set) var images: [String]?
    public private(set) var price: Double?
    public private(set) var description: String?
    public private(set) var detail: String?
    public private(set) var type: String?
    public private(set) var brand: String?
    public private(set) var qr_code: String?
    public private(set) var colors: [String]?
    public private(set) var sizes: [String]?
    public private(set) var shipping: Int?
    public private(set) var weight: Int?
    public private(set) var width: Int?
    public private(set) var height: Int?
    public private(set) var isPaid: Bool?
    public private(set) var availability: Int?
    public var isLiked: Bool?
    public var isAddedToBasket: Bool?
    
    init() {
    }
    
    init(uid: String, name: String, images: [String], price: Double, description: String, detail: String, type: String, brand: String, qr_code: String, colors: [String], sizes: [String], shipping: Int, weight: Int, width: Int, height: Int, isPaid: Bool, availability: Int, isLiked: Bool, isAddedToBasket: Bool)
    {
        self.uid = uid
        self.name = name
        self.images = images
        self.price = price
        self.description = description
        self.detail = detail
        self.type = type
        self.brand = brand
        self.qr_code = qr_code
        self.colors = colors
        self.sizes = sizes
        self.shipping = shipping
        self.weight = weight
        self.width = width
        self.height = height
        self.isPaid = isPaid
        self.availability = availability
        self.isLiked = isLiked
        self.isAddedToBasket = isAddedToBasket
    }
    
  
}


