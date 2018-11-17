//
//  AssetItem.swift
//  Swift4_Part4_TableView
//
//  Created by Admin on 30/10/18.
//  Copyright © 2018 Equitronix. All rights reserved.
//

import Foundation
class AssetItem:NSObject,  NSSecureCoding {
    static var supportsSecureCoding: Bool {
        return true;
    }
    
    
    var name: String;
    var value: Int;
    var serialNumber: String?;
    let dateCreated: Date;
    let imageKey: String;
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(value, forKey: "value")
        aCoder.encode(serialNumber, forKey: "serialNumner")
        aCoder.encode(dateCreated, forKey: "dateCreated")
        aCoder.encode(imageKey, forKey:"imageKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        
        guard let n = aDecoder.decodeObject(of: NSString.self, forKey: "name") else {
            let error = CocoaError.error(.coderValueNotFound, userInfo: [NSLocalizedDescriptionKey: "Name of Asset Item could not be read."])
            aDecoder.failWithError(error)
            return nil;
        }
        self.name = n as String;
        
        value = aDecoder.decodeInteger(forKey: "value")
        serialNumber = aDecoder.decodeObject(forKey: "serialNumber") as! String?
        //        dateCreated = aDecoder.decodeObject(forKey: "dateCreated") as! Date
        if let dc = aDecoder.decodeObject(of: NSDate.self, forKey: "dateCreated"){
            dateCreated = dc as Date} else {
            let error = CocoaError.error(.coderValueNotFound);
            aDecoder.failWithError(error)
            return nil;
        }
        
        imageKey = aDecoder.decodeObject(forKey: "imageKey") as! String
        super.init();
    }
    
    
    init(name:String, value: Int, serialNumber: String?){
        self.name = name;
        self.value = value;
        self.serialNumber = serialNumber;
        self.dateCreated = Date();
        self.imageKey = UUID().uuidString;
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
