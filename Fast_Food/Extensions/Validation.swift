//
//  Ext_String.swift
//  Fast_Food
//
//  Created by sudhir on 07/06/21.
//

import Foundation
import UIKit
extension String {
//    Mark regex for email
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern:"[A-Za-z]{4}+[_0-9]+@[A-Za-z]+(\\.[A-Za-z]{2})")
//            ,options: .caseInsensitive)
        return regex.firstMatch(in: self, range: NSRange(location: 0, length: count)) != nil
    }
//    let  isValidPassword: Bool {
//        if se
//        
//        
//    }
}
    

