//
//  AssetItem.swift
//  Swift4_Part4_TableView
//
//  Created by Admin on 30/10/18.
//  Copyright © 2018 Equitronix. All rights reserved.
//

import Foundation
class AssetItem:NSObject {
    var name: String;
    var value: Int;
    var serialNumber: String?;
    let dateCreated: Date;
    
    init(name:String, value: Int, serialNumber: String?){
        self.name = name;
        self.value = value;
        self.serialNumber = serialNumber;
        self.dateCreated = Date();
    }
    convenience init(random: Bool = false){
        if random{
            let adjectives = ["sharp","expensive","worn out"];
            let nouns = ["knife","speaker","fork"];
            
            self.init(name: "\(nouns[Int(arc4random_uniform(UInt32(nouns.count)))]) \(adjectives[Int(arc4random_uniform(UInt32(adjectives.count)))])",
                value:Int(arc4random_uniform(UInt32(100))),
                serialNumber: UUID().uuidString.components(separatedBy: "-").first);
        }else{
            self.init(name:"", value:0, serialNumber: nil);
        }
    }
    
}
