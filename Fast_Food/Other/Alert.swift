//
//  Alert.swift
//  Fast_Food
//
//  Created by sudhir on 06/06/21.
//
import UIKit

//protocol AlertDelegate: AnyObject {
//    func setDoneHandler()
//    func setCancelHandler()
//}

class Alert:UIViewController {
//    static weak var delegate: AlertDelegate?
    
    static let shared = Alert()
    
     var alert:UIAlertController!
     func makeAlert(
        title: String,
        message: String? = nil,
        controller: UIViewController
    ) ->UIAlertController{
        alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: .alert)
        return alert
        
    }
    
   
}
