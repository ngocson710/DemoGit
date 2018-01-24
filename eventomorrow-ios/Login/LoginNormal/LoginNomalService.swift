//
//  LoginNormalModel.swift
//  DemoAlamofire
//
//  Created by Le Anh Dat on 1/16/18.
//  Copyright © 2018 Le Anh Dat. All rights reserved.
//

import Foundation
import Alamofire

class LoginNormalService {
    let url = "http://192.168.81.174:8080/auth/login"
    func checkLogin( email:String, password:String, completion: @escaping (Int?) -> Void) {
        let parameters: [String : String] = ["email": email,"password":password]
        Alamofire.request(url, method: .post,parameters: parameters,encoding: JSONEncoding.default).responseJSON { response in
            print(type(of: response.response?.statusCode))
            completion(response.response?.statusCode)
        }
    }
    
    
//    public func parseJsonProfile(data:String) -> Profile{
//        var profile = Profile()
//        return profile
//    }
}



