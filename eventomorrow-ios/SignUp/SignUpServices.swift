//
//  SignUpServices.swift
//  eventomorrow-ios
//
//  Created by Nguyen Ngoc Son on 1/17/18.
//  Copyright © 2018 Nguyen Ngoc Son. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class SinUpServices{
    
    func getDataSignUp(register:Register, completion: @escaping ((Int)->Void)){
        let url = "http://192.168.81.174:8080/auth/signup-storm"
        let params = ["email": register.email, "name": register.name, "password": register.password, "phoneNumber": register.phoneNumber]
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { (response) in
            print("ket qua 3: \(String(describing: response.response?.statusCode))")
            completion((response.response?.statusCode)!)
        }
    }
}
