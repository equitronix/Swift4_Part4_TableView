//
//  AssetsTableViewController.swift
//  Swift4_Part4_TableView
//
//  Created by Admin on 30/10/18.
//  Copyright © 2018 Equitronix. All rights reserved.
//

import UIKit

class AssetsTableViewController: UITableViewController {
    
    var assetStore: AssetStore!
    
    
    @IBAction func toggleEditingMode(_ sender: UIButton){
        if isEditing {
            sender.setTitle("Edit", for: .normal)
            self.setEditing(false, animated: true)
        }else{
            sender.setTitle("Done", for: .normal)
            self.setEditing(true, animated: true)
        }
    }
    @IBAction func addItem(_ sender: UIButton){
        assetStore.createItem();
        tableView.insertRows(at: [IndexPath(row: assetStore.allItems.count-1, section: 0)], with: .automatic);
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let statusBarHeight = UIApplication.shared.statusBarFrame.height;
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0);
        tableView.contentInset  = insets;
        tableView.scrollIndicatorInsets = insets;
        tableView.rowHeight = UITableView.automaticDimension;
        tableView.estimatedRowHeight = 65;
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return assetStore.allItems.count;
    //    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return assetStore.allItems.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell;
        let item = assetStore.allItems[indexPath.row];
//        cell.textLabel?.text = assetStore.allItems[indexPath.row].name;
//        cell.detailTextLabel?.text = "Rs \(assetStore.allItems[indexPath.row].value)";
        cell.NameLabel.text = item.name
        cell.PriceLabel.text = "$\(item.value)"
        cell.SerialLabel.text = item.serialNumber
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = assetStore.allItems[indexPath.row];
            let ac = UIAlertController(title: "Delete \(item.name)", message: "Sure you want to go ahead", preferredStyle: .actionSheet);
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (UIAlertAction) in
                self.assetStore.removeItem(at: indexPath.row);
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            ac.addAction(deleteAction)
            
            present(ac, animated:true, completion: nil);
            
            
        }
    }
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
