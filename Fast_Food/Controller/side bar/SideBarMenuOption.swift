//
//  SideBarMenuConstant.swift
//  Fast_Food
//
//  Created by sudhir on 22/07/21.
//

import UIKit

enum SideBarMenuOption: String,CaseIterable{
    //cases with rawValue
    case home         = "Home"
    case account      = "Account"
    case order        = "Your Order"
    case yourFavList  = "Your Fav List"
    case logout       = "Logout"
    
    //static associated value
    var imageName: String{
        switch self{
        case .home:
            return "homekit"
        case .account:
            return "person"
        case .order:
            return "star"
        case .yourFavList:
            return "heart"
        case .logout:
            return "pip.exit"
        }
    }
}
