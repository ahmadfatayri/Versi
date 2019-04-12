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
    
    public private(set) var id: Int = 0
    public private(set) var image: UIImage?
    public private(set) var title: String = ""
    
    func config(id: Int, title: String, image: UIImage) {
        self.id = id
        self.title = title
        self.image = image
    }
    
}
