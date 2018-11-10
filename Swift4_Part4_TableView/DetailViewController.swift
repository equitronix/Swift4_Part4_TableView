//
//  DetailViewController.swift
//  Swift4_Part4_TableView
//
//  Created by Admin on 10/11/18.
//  Copyright © 2018 Equitronix. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var nameField: UITextField!
    @IBOutlet var serialField: UITextField!
    @IBOutlet var valueField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    
    var item: AssetItem!
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    let dateFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: Int(3600*5.5))
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        nameField.text = item.name
        serialField.text = item.serialNumber
//        valueField.text = "\(item.value)"
//        dateLabel.text = "\(item.dateCreated)"
        
        valueField.text = numberFormatter.string(from: NSNumber(value: item.value))
        dateLabel.text = dateFormatter.string(from: item.dateCreated)
    }
/*     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
 */
 

}
