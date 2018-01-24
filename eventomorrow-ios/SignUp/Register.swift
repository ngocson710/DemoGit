//
//  Register.swift
//  eventomorrow-ios
//
//  Created by Nguyen Ngoc Son on 1/17/18.
//  Copyright © 2018 Nguyen Ngoc Son. All rights reserved.
//

import Foundation

struct Register {
    let email:String
    let name:String
    let password:String
    let phoneNumber:String
    
    init(email:String, name:String, password:String, phoneNumber:String) {
        self.email=email
        self.name=name
        self.password=password
        self.phoneNumber=phoneNumber
    }
}


