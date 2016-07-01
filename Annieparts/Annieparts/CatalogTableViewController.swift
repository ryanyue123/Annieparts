//
//  CatalogTableViewController.swift
//  Annieparts
//
//  Created by Ryan Yue on 6/29/16.
//  Copyright © 2016 boyang. All rights reserved.
//

import UIKit

class CatalogTableViewController: UITableViewController {
    
    // MARK: - Declare variables
    private let BASE_URL = "http://192.168.1.111/www/"
    var catalog_data = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        get_json_data("catalog", query_paramters: ["year": "2014"]) { (json) in
            self.catalog_data = json!["goods"] as! NSArray
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.catalog_data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("product_cell") as! ProductTableViewCell
        if let product_name = self.catalog_data[indexPath.row]["name"] as? String {
            cell.product_name.text = product_name
        }
        if let goods_img = self.catalog_data[indexPath.row]["img"] as? String {
            let url_string = BASE_URL + goods_img
            let image_url = NSURL(string: url_string)
            cell.product_image.image = UIImage(data: NSData(contentsOfURL: image_url!)!)
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showDetail", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showDetail") {
            let upcoming = segue.destinationViewController as? ProductDetailViewController
            let query_id = String(self.catalog_data[(self.tableView.indexPathForSelectedRow?.row)!]["id"] as! Int)
            upcoming?.product_id = query_id
        }
    }
}
