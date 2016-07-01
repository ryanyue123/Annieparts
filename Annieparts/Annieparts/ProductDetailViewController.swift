//
//  ProductDetailViewController.swift
//  Annieparts
//
//  Created by Ryan Yue on 6/30/16.
//  Copyright © 2016 boyang. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    // MARK: - Declare variables
    var product_id: String!
    private var product_info: NSDictionary!
    
    // MARK: - View management
    override func viewDidLoad() {
        super.viewDidLoad()
        //disable the add to cart button until completion in get_json_data()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        get_json_data("product", query_paramters: ["goods_id": self.product_id]) { (json) in
            self.product_info = json
            self.configure_product_info()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Configure UI
    func configure_product_info() {
        //set all labels/images..etc
    }
}
