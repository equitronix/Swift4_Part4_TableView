//
//  AssetStore.swift
//  Swift4_Part4_TableView
//
//  Created by Admin on 30/10/18.
//  Copyright © 2018 Equitronix. All rights reserved.
//

import UIKit

class AssetStore {
    var allItems =  [AssetItem]();
    let itemArchiveURL: URL = {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return documentsDirectory.first!.appendingPathComponent("items.archive");
    }()
    
    init() {
        do{
            let data = try Data.init(contentsOf: itemArchiveURL)
            allItems = try NSKeyedUnarchiver.unarchivedObject(ofClasses: [NSArray.self, AssetItem.self], from: data) as! [AssetItem] ;

//            let unarchiver = try NSKeyedUnarchiver.init(forReadingFrom: data);
//            let xx  = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data);
//            let yy = xx as? [AssetItem];
        }catch{
            print("error loading data from file \(error)");
            
            if let e = error as? CocoaError {
                print("The error is: \(e.userInfo[NSLocalizedDescriptionKey]!)");
                
            }
        }
    }
    @discardableResult func createItem() -> AssetItem{
        let item = AssetItem(random: true);
        allItems.append(item);
        return item;
        
    }
    func removeItem(item: AssetItem) -> Void {
        if let index = allItems.firstIndex(of: item) {
            allItems.remove(at: index);
        }
    }
    func removeItem(at index:Int){
        allItems.remove(at: index);
    }
    
    @discardableResult func saveChanges() -> Bool {
        print("Saving to URL \(itemArchiveURL.path)");
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: allItems, requiringSecureCoding: true)
            print("the data is \(data)");
            try data.write(to: itemArchiveURL)
        }catch{
            print("error while encoding or writing. \(error)");
        }
        
        return true;
    }
}
