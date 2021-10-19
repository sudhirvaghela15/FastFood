//
//  SignUpValidation.swift
//  Fast_Food
//
//  Created by sudhir on 03/08/21.
//

import Foundation
import UIKit

class SignUpValidation {
    func validate(request:SignUpRequest)-> ValidationResult{
        
        if( !request.userEmail.isEmpty &&
            !request.userPassword.isEmpty &&
            !request.userConfirmPassword.isEmpty){
            if(request.userEmail.validateEmail() ){
                return ValidationResult(success: true, errorMessage: nil)
            }else{
                return ValidationResult(success: false, errorMessage: "Please enter valid email")
            }
        }else{
            return ValidationResult(success: false, errorMessage: "Please enter valid email")
        }
    }
}
