//
//  ProductDetailViewController.swift
//  Annieparts
//
//  Created by Ryan Yue on 6/30/16.
//  Copyright © 2016 boyang. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    var product_id: String!
    private var product_info: NSDictionary!
    override func viewDidLoad() {
        super.viewDidLoad()
        get_json_data("product", query_paramters: ["goods_id": self.product_id]) { (json) in
            self.product_info = json
            self.configure_product_info()
        }
        // Do any additional setup after loading the view.
    }
    func configure_product_info() {
        //set all labels/images..etc
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
