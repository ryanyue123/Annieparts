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
]

func get_json_data(query_type: String, query_paramters: [String: AnyObject], completion: (NSDictionary?) -> Void) {
    let query_url = BASE_URL + query_type_url[query_type]! + "?"
    Alamofire.request(
        .GET,
        query_url,
        parameters: query_paramters
    ).validate().responseJSON { response in
        print(response.request?.URL)
        if let json = response.result.value {
            completion(json as? NSDictionary)
        }
    }
}
func parse_config_data() {
    var id_reference = [NSDictionary]()
    get_json_data("config", query_paramters: [:]) { (json) in
        for key in (json?.allKeys)! {
            if let key = key as? String {
                if let attr_array = json![key] as? [NSDictionary] {
                    id_reference.appendContentsOf(attr_array)
                }
            }
        }
        id_reference_list = id_reference
        if let years = json!["years"] as? NSArray {
            year_list = years
        }
        if let manufacturers = json!["manufactures"] as? NSArray {
            manufacturer_list = manufacturers
        }
        if let models = json!["models"] as? NSArray {
            model_list = models
        }
        if let attributes = json!["attributes"] as? NSArray {
            product_type_list = attributes
        }
    }
}