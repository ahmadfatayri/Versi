//
//  MultiLangExt.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 6/18/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

extension UIViewController {
    func getByTagName(key: String) -> String {

        var dictRoot: NSDictionary?
        var value = ""
        let defaults = UserDefaults.standard
        if let lng = defaults.string(forKey: DEFAULTKEY.lng) {
            if lng == "en" {
                if let path = Bundle.main.path(forResource: "versiEng", ofType: "plist") {
                    dictRoot = NSDictionary(contentsOfFile: path)
                }
            }
            else {
                if let path = Bundle.main.path(forResource: "versiFr", ofType: "plist") {
                    dictRoot = NSDictionary(contentsOfFile: path)
                }
            }
        }
        else {
            if let path = Bundle.main.path(forResource: "versiEng", ofType: "plist") {
                dictRoot = NSDictionary(contentsOfFile: path)
            }
        }
        if dictRoot != nil
        {
            value = dictRoot?[key] as! String
        }
        return value
    }
}


extension UITableViewCell {
    func getByTagName(key: String) -> String {
        
        var dictRoot: NSDictionary?
        var value = ""
        let defaults = UserDefaults.standard
        if let lng = defaults.string(forKey: DEFAULTKEY.lng) {
            if lng == "en" {
                if let path = Bundle.main.path(forResource: "versiEng", ofType: "plist") {
                    dictRoot = NSDictionary(contentsOfFile: path)
                }
            }
            else {
                if let path = Bundle.main.path(forResource: "versiFr", ofType: "plist") {
                    dictRoot = NSDictionary(contentsOfFile: path)
                }
            }
        }
        else {
            if let path = Bundle.main.path(forResource: "versiEng", ofType: "plist") {
                dictRoot = NSDictionary(contentsOfFile: path)
            }
        }
        if dictRoot != nil
        {
            value = dictRoot?[key] as! String
        }
        return value
    }
}
