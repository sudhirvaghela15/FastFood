//
//  Alert.swift
//  Fast_Food
//
//  Created by sudhir on 06/06/21.
//

import Foundation
import UIKit

protocol AlertDelegate: AnyObject {
    func setDoneHandler()
    func setCancelHandler()
}

class Alert{
    
    static weak var delegate: AlertDelegate?
    static var alert:UIAlertController!
    
    static func makeAlert(title: String,
                          message: String? = nil,
                          controller: UIViewController) ->UIAlertController{
        alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: .alert)
        return alert
    }
    
    static func alertCancel(buttonTitle: String){
        
        alert.addAction(UIAlertAction(title: buttonTitle, style: .cancel, handler: { _ in
                delegate?.setCancelHandler()
        }))
    }
    static func alertDone(buttonTitle: String){
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: { _ in
                    delegate?.setDoneHandler()
        }))
    }
    
}
