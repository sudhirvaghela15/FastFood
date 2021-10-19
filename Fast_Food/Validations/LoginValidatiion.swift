//
//  LoginValidatiion.swift
//  Fast_Food
//
//  Created by sudhir on 03/08/21.
//

import Foundation
import UIKit


struct LoginValidation  {
    func validate(request: LoginRequest) -> ValidationResult {
        
        if(!request.userEmail.isEmpty && !request.userPassword.isEmpty){
            if(request.userEmail.validateEmail()){
                return ValidationResult.init(success: true, errorMessage: nil)
            }else{
                return ValidationResult(success: false, errorMessage: "Please enter valid email")
            }
        }else{
            return ValidationResult(success: false, errorMessage: "Please enter valid email")
        }
    }
}
