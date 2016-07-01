//
//  LaunchViewController.swift
//  Annieparts
//
//  Created by Ryan Yue on 7/1/16.
//  Copyright © 2016 boyang. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        get_json_data("config", query_paramters: [:]) { (json) in
            var id_reference = [NSDictionary]()
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
            self.performSegueWithIdentifier("loadCfg", sender: self)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
