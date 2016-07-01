//
//  ProductTableViewCell.swift
//  Annieparts
//
//  Created by Ryan Yue on 6/29/16.
//  Copyright © 2016 boyang. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    // MARK: - Declare outlets/actions
    @IBOutlet weak var product_image: UIImageView!
    @IBOutlet weak var product_name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
