//
//  SearchViewController.swift
//  Annieparts
//
//  Created by Ryan Yue on 6/30/16.
//  Copyright © 2016 boyang. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - Declare variables
    // TODO: - Replace these variables with pickerView.selected
    private var selected_brand: String!
    private var selected_model: String!
    private var selected_product_type: String!
    private var selected_year: String!
    private var selected_brand_name: String!
    
    // MARK: - View managemetn
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Finding query ID
    
    func build_query_parameters() -> [String: AnyObject] {
        let query_parameters = [
            "brand": find_id_from_name(self.selected_brand_name),
            "model": find_id_from_name(self.selected_model),
            "attr": find_id_from_name(self.selected_product_type),
            "year": find_id_from_name(self.selected_year)
        ]
        return query_parameters
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "performSearch") {
            let upcoming = segue.destinationViewController as? CatalogTableViewController
            get_json_data("catalog", query_paramters: build_query_parameters(), completion: { (json) in
                upcoming?.catalog_data = json!["goods"] as! NSArray
            })
        }
    }
}
