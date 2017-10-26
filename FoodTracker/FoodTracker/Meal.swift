//
//  Meal.swift
//  FoodTracker
//
//  Created by 耿楷寗 on 23/10/2017.
//  Copyright © 2017 EIE. All rights reserved.
//

import UIKit

class Meal {
    var name:String
    var photo:UIImage?
    var rating:Int
    
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
}


