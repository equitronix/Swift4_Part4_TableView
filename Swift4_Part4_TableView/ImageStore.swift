//
//  ItemStore.swift
//  Swift4_Part4_TableView
//
//  Created by Admin on 11/11/18.
//  Copyright © 2018 Equitronix. All rights reserved.
//

import UIKit

class ImageStore{
    
    let cache = NSCache<NSString, UIImage>()
    
    func setImage(forImage image: UIImage, forKey key: String){
        cache.setObject(image, forKey: key as NSString)
    }
    func getImage(forKey key: String) -> UIImage?{
        return cache.object(forKey: key as NSString)
    }
    func deleteImage(forKey key: String){
        cache.removeObject(forKey: key as NSString)
    }
}
