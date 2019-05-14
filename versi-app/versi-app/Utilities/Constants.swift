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


let BASE_URL = "https://versi.herokuapp.com/"
let URL_REGISTER = "\(BASE_URL)users/register"
let URL_LOGIN = "\(BASE_URL)users/authenticate"
let URL_PRODUCTS = "\(BASE_URL)products/getAll"
let URL_FIND_PRODUCT = "\(BASE_URL)products/getById/"
let URL_PRODUCTS_FILTERS = "\(BASE_URL)products/getWithFilters"
let URL_GET_CATEGORIES = "\(BASE_URL)category/getAll"
let URL_GET_SUB_CATEGORIES = "\(BASE_URL)category/get"
let URL_WISHLIST_GET = "\(BASE_URL)wishlist/get"
let URL_WISHLIST_ADD = "\(BASE_URL)wishlist/add"
let URL_WISHLIST_REMOVE = "\(BASE_URL)wishlist/remove"
let URL_CART_GET = "\(BASE_URL)cart/get"
let URL_CART_ADD = "\(BASE_URL)cart/add"
let URL_CART_REMOVE = "\(BASE_URL)cart/remove"
let URL_CONTACTUS = "\(BASE_URL)contact/create"
let URL_PROFILE = "\(BASE_URL)profile/get/"

// User Defaults
let LOGGED_IN_KEY = "loggedIn"


// Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

//default login
let USERNAME = "guest@guest.com"
let PASSWORD = "123456"

//keychain
let ACCOUNTKEY = "user"
let ACCOUNTID = "id"
let SERVICEKEY = "auth"
let SERVICEID = "id"
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


