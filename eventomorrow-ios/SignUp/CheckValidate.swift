//
//  CheckValidate.swift
//  eventomorrow-ios
//
//  Created by Nguyen Ngoc Son on 1/19/18.
//  Copyright © 2018 Nguyen Ngoc Son. All rights reserved.
//

import Foundation

class CheckValidate {
    func isValidEmail(testStr:String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func isSamePassword(pass1:String, pass2:String) -> Bool {
        if pass1 != pass2{
            return false
        } else{
            return true
        }
    }

    func validPhone(value: String) -> Bool {
        let PHONE_REGEX = "^((\\+)|(00))[0-9]{6,14}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
}
