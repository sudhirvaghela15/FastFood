//
//  SignUpRequest.swift
//  Fast_Food
//
//  Created by sudhir on 03/08/21.
//

import Foundation
import UIKit


struct SignUpRequest:Encodable {
    let userEmail,userPassword,userConfirmPassword:String
}
