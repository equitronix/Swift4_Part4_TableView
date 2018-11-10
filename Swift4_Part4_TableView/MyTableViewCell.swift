//
//  MyTableViewCell.swift
//  Swift4_Part4_TableView
//
//  Created by Admin on 05/11/18.
//  Copyright © 2018 Equitronix. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    
    @IBOutlet weak var NameLabel: UILabel!;
    @IBOutlet weak var SerialLabel: UILabel!;
    @IBOutlet weak var PriceLabel: UILabel!;
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        NameLabel.adjustsFontForContentSizeCategory = true;
        SerialLabel.adjustsFontForContentSizeCategory = true;
        PriceLabel.adjustsFontForContentSizeCategory = true;
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
