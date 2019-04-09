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
    let navigationNext: String
}

let group1 = [
    PreviewDetail(title: "Orders", description: "Check your status", iconName: "orders", navigationNext: ""),
    PreviewDetail(title: "Help Center", description: "Help regarding your recent purchases", iconName: "help", navigationNext: ""),
    PreviewDetail(title: "Wishlist", description: "Your most loved styles", iconName: "love", navigationNext: ""),
    PreviewDetail(title: "Collections", description: "All your curated product cpllections", iconName: "orders", navigationNext: "")
//    PreviewDetail(title: "Liked Products", description: "All products liked by you", iconName: "love", navigationNext: "")
]

let group2 = [
    PreviewDetail(title: "Versi Credit", description: "Manage all your refunds & gif cards", iconName: "credit", navigationNext: ""),
    PreviewDetail(title: "Versi Points", description: "Earn points as you shop and use them in checkout", iconName: "orders", navigationNext: ""),
    PreviewDetail(title: "Saved Cards", description: "Save your cards for faster checkout", iconName: "credit_cards", navigationNext: ""),
    PreviewDetail(title: "Address", description: "Save your address for hassle-free checkout", iconName: "location", navigationNext: "AddressesVC"),
]

let group3 = [
    PreviewDetail(title: "Profile Details", description: "Change your profile details & password", iconName: "edit", navigationNext: ""),
    
]
