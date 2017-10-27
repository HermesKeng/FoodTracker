//
//  Meal.swift
//  FoodTracker
//
//  Created by 耿楷寗 on 23/10/2017.
//  Copyright © 2017 EIE. All rights reserved.
//

import UIKit
import os.log
class Meal : NSObject,NSCoding {
    var name:String
    var photo:UIImage?
    var rating:Int
    static var DocumentsDirectory = FileManager().urls(for: .documentDirectory , in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")// important!!!! notice!!!!
    
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey : PropertyKey.name) as? String else{
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        self.init(name:name,photo:photo,rating:rating)
    }
    
    init?(name:String,photo:UIImage?,rating:Int){
        
        guard !name.isEmpty else{
            return nil
        }
        guard rating<=5&&rating>=0 else{
            return nil
        }
        self.name=name
        self.photo=photo
        self.rating=rating
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    

}


