//
//  Constants.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/8/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import Foundation
import UIKit




typealias CompletionHandler = (_ Success: Bool) -> ()


// URL Constants
let PATH_LOGIN = Bundle.main.path(forResource: "login_success", ofType: "json")
let URL_LOGIN=URL(fileURLWithPath: PATH_LOGIN!)

let PATH_REGISTER = Bundle.main.path(forResource: "register_success", ofType: "json")
let URL_REGISTER=URL(fileURLWithPath: PATH_REGISTER!)

let PATH_CATEGORIES = Bundle.main.path(forResource: "category", ofType: "json")
let URL_CATEGORIES=URL(fileURLWithPath: PATH_CATEGORIES!)

let PATH_PRODUCTS = Bundle.main.path(forResource: "products", ofType: "json")
let URL_PRODUCTS=URL(fileURLWithPath: PATH_PRODUCTS!)

//let BASE_URL = "https://test.com/"
//let URL_REGISTER = "\(BASE_URL)account/register"



// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"


// Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]


//navigations
let STORYBOARD = UIStoryboard(name: "Main", bundle: nil)

let SIGNUP: String = "SignupVC"
let SIGNIN: String = "LoginVC"
let FORGOTPASSWORD: String = "ForgotPasswordVC"
let HOME: String = "HomeVC"
let CATEGORY: String = "CategoryVC"
let ACCOUNT: String = "AccountVC"
let ADDRESSES: String = "AddressesVC"
let PRODUCTDETAILS: String = "ProductDetailTableViewController"
let PRODUCTIMAGEVC: String = "SignupVC"
let PRODUCTIMAGESPAGE: String = ""
let BOTTOMBAR: String = "BottomBar"
let WISHLIST: String = "WishlistVC"
