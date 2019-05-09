//
//  SubCategory.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/12/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import Foundation
import UIKit

class SubCategory {
    
    static let instance = SubCategory()
    
    public private(set) var id: String = ""
    public private(set) var image: String = ""
    public private(set) var title: String = ""
    public private(set) var category_id: String = ""

    
    func config(id: String, title: String, image: String, category_id: String) {
        self.id = id
        self.title = title
        self.image = image
        self.category_id = category_id
    }
    
}
