//
//  Constatnt.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/5/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import Foundation

/// A simple data structure to populate the table view.
struct PreviewDetail {
    let title: String
    let description: String
    let iconName: String
}

let group1 = [
    PreviewDetail(title: "Contact us", description: "Tell us your problem", iconName: "orders"),
    PreviewDetail(title: "Help Center", description: "Help regarding your recent purchases", iconName: "help"),
    PreviewDetail(title: "Wishlist", description: "Your most loved styles", iconName: "love"),
    PreviewDetail(title: "Invate Friend", description: "", iconName: "orders")
]

let group2 = [
    PreviewDetail(title: "Search", description: "Manage all your refunds & gif cards", iconName: "credit"),
    PreviewDetail(title: "Versi Points", description: "Earn points as you shop and use them in checkout", iconName: "orders"),
    PreviewDetail(title: "Saved Cards", description: "Save your cards for faster checkout", iconName: "credit_cards"),
    PreviewDetail(title: "Address", description: "Save your address for hassle-free checkout", iconName: "location")
]

let group3 = [
    PreviewDetail(title: "Profile Details", description: "Change your profile details & password", iconName: "edit"),
    
]
