//
//  CatalogTableViewController.swift
//  Annieparts
//
//  Created by Ryan Yue on 6/29/16.
//  Copyright © 2016 boyang. All rights reserved.
//

import UIKit

class CatalogTableViewController: UITableViewController {
    
    // MARK - Declare Variables
    private let BASE_URL = "http://192.168.1.111/www/"
    private var catalog_data = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        get_json_data("catalog", query_paramters: ["year": "2014"]) { (json) in
            self.catalog_data = json!["goods"] as! NSArray
            self.tableView.reloadData()
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.catalog_data.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("product_cell") as! ProductTableViewCell
        if let product_name = self.catalog_data[indexPath.row]["goods_name"] as? String {
            cell.product_name.text = product_name
        }
        if let goods_img = self.catalog_data[indexPath.row]["goods_img"] as? String {
            let url_string = BASE_URL + goods_img
            let image_url = NSURL(string: url_string)
            cell.product_image.image = UIImage(data: NSData(contentsOfURL: image_url!)!)
        }
        return cell
    }
}
