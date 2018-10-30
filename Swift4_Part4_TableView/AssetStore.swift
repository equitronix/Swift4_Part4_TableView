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
    init(){
        for _ in 0..<5 {
            createItem();
        }
    }
     @discardableResult func createItem() -> AssetItem{
        let item = AssetItem(random: true);
        allItems.append(item);
        return item;
        
    }
}
