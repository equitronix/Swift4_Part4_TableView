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
}
