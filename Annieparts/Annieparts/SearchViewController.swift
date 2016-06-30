//
//  SearchViewController.swift
//  Annieparts
//
//  Created by Ryan Yue on 6/30/16.
//  Copyright © 2016 boyang. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    // Can replace with the pickerview.selected or something similar
    private var selected_brand: String!
    private var selected_model: String!
    private var selected_product_type: String!
    private var selected_year: String!
    
    private var selected_brand_name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func find_id_from_name(name: String) -> String {
        let results = id_reference_list.filter({
            $0["name"] as? String == name
        })
        if let id_string = results[0]["id"] as? String {
            return id_string
        } else {
            return ""
        }
    }
    func build_query_parameters() -> [String: AnyObject] {
        let query_parameters = [
            "brand": self.find_id_from_name(self.selected_brand_name),
            "model": self.find_id_from_name(self.selected_model),
            "attr": self.find_id_from_name(self.selected_product_type),
            "year": self.find_id_from_name(self.selected_year)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
