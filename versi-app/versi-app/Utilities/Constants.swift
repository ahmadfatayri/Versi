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
let PATH_CATEGORIES = Bundle.main.path(forResource: "category", ofType: "json")
let URL_CATEGORIES = URL(fileURLWithPath: PATH_CATEGORIES!)

let PATH_WISHLIST = Bundle.main.path(forResource: "wishlist", ofType: "json")
let URL_WISHLIST = URL(fileURLWithPath: PATH_WISHLIST!)

let BASE_URL = "https://versi.herokuapp.com/"
let URL_REGISTER = "\(BASE_URL)users/register"
let URL_LOGIN = "\(BASE_URL)users/authenticate"
let URL_PRODUCTS = "\(BASE_URL)products/getAll"

// User Defaults
let LOGGED_IN_KEY = "loggedIn"


// Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]


//navigations
let STORYBOARD = UIStoryboard(name: "Main", bundle: nil)

let WELCOME: String = "WelcomeVC"
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
let ADDADDRESS: String = "AddAddressVC"
let ADDCREDITS: String = "AddCreditVC"
let CREDITS: String = "CreditsVC"
let PROFILEDETAILS: String = "ProfileDetailsVC"
let SUBCATEGORY: String = "SubCategoryVC"
let SUBSUBCATEGORY: String = "SubSubCatVC"
let PRODUCTVARIANTS: String = "ProductVariantsVC"
let CHECKOUT: String = "CheckoutVC"
let CONTACT: String = "ContactusVC"
let CHANGEPASSWORD: String = "ChangePasswordVC"
let SEARCH: String = "SearchVC"
let SCAN: String = "ScanVC"
let HELP: String = "HelpVC"
let CART: String = "CartVC"


