//
//  data_handler.swift
//  Annieparts
//
//  Created by Ryan Yue on 6/29/16.
//  Copyright © 2016 boyang. All rights reserved.
//
import SwiftyJSON
import Alamofire

import Foundation

var id_reference_list = []
var year_list = []
var manufacturer_list  = []
var model_list = []
var product_type_list = []

private let BASE_URL = "http://192.168.1.111/www/"
private let query_type_url = [
    "config": "getCfg.php",
    "catalog": "search4app.php",
    "product": "getGoodsInfor.php",
]

func get_json_data(query_type: String, query_paramters: [String: AnyObject], completion: (NSDictionary?) -> Void) {
    let query_url = BASE_URL + query_type_url[query_type]! + "?"
    Alamofire.request(
        .GET,
        query_url,
        parameters: query_paramters
    ).validate().responseJSON { response in
        print(response.request!.URL!.URLString)
        if let json = response.result.value {
            completion(json as? NSDictionary)
        }
    }
}

// FIXME: - Finish running this function after launching the application before proceeding

// Given name of the selected item in each search category, find the corresponding ID to use in the GET request.
func find_id_from_name(name: String) -> String {
    if (name == "-") {
        return ""
    }
    let results = id_reference_list.filter({
        $0["name"] as? String == name
    })
    if let id_string = results[0]["id"] as? Int {
        return String(id_string)
    } else {
        return ""
    }
}

// Save/read shopping cart information in NSUserDefaults
func read_saved_shopping_cart() -> NSDictionary {
    let defaults = NSUserDefaults.standardUserDefaults()
    if let shopping_cart = defaults.objectForKey("shopping_cart") as? NSDictionary {
        return shopping_cart
    }
    return NSDictionary()
}

func save_shopping_cart(shopping_cart: NSDictionary) {
    let defaults = NSUserDefaults.standardUserDefaults()
    defaults.setObject(shopping_cart, forKey: "shopping_cart")
}