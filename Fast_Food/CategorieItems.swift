//
//  SubCategories.swift
//  Fast_Food
//
//  Created by sudhir on 04/06/21.
//

import Foundation
import UIKit



struct Catagories{
    var itemName: String!
    var subItemName: [String]!
    var subItmeImage: [String]!
}




var catagories = [
    Catagories(itemName: "Burger",
               subItemName: ["CheesBurger","NormalBurger","spicyBurger","CheesBurger","NormalBurger","spicyBurger","CheesBurger","NormalBurger","spicyBurger"],
               subItmeImage: ["pizza","pizza","pizza","pizza","pizza","pizza","pizza","pizza","pizza"]),
    
    Catagories(itemName: "Sub Way",
               subItemName: ["CheesBurger","NormalBurger","spicyBurger","CheesBurger","NormalBurger","spicyBurger","CheesBurger","NormalBurger","spicyBurger"],
               subItmeImage: ["pizza","pizza","pizza","pizza","pizza","pizza","pizza","pizza","pizza"]),
    
    Catagories(itemName: "Pizza",
               subItemName: ["CheesBurger","NormalBurger","spicyBurger","CheesBurger","NormalBurger","spicyBurger","CheesBurger","NormalBurger","spicyBurger"],
               subItmeImage: ["pizza","pizza","pizza","pizza","pizza","pizza","pizza","pizza","pizza"]),
    
    Catagories(itemName: "Chinese",
               subItemName: ["ItalianPizza","NormalBurger","spicyBurger","CheesBurger","NormalBurger","spicyBurger","CheesBurger","NormalBurger","spicyBurger"],
               subItmeImage: ["pizza","pizza","pizza","pizza","pizza","pizza","pizza","pizza","pizza"]),
]




