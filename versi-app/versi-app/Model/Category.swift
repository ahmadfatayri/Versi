//
//  CategoryModel.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/4/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import Foundation

class CategoryModel {
    
    static let instance = CategoryModel()
    
    public private(set) var id = ""
    public private(set) var imageUrl = ""
    public private(set) var title = ""
    public private(set) var description = ""
    //public private(set) var subCategories: [SubCategory] = []
    
    func config(id: String, title: String, description: String, imageUrl: String) {
        self.id = id
        self.description = description
        self.title = title
        self.imageUrl = imageUrl
    }
    
}
