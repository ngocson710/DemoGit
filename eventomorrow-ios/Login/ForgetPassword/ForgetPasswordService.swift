//
//  ForgetPasswordService.swift
//  eventomorrow-ios
//
//  Created by Nguyen Ngoc Son on 1/22/18.
//  Copyright © 2018 Nguyen Ngoc Son. All rights reserved.
//

import Foundation
import Alamofire

class ForgetPasswordService {
    func getDataForgetPassword(email:String, completion: @escaping ((DataResponse<Any>) -> Void)) {
        let urlString = "http://192.168.81.174:8080/auth/forgot-password"
        let url = URL(string: urlString)
        let params: [String : String] = ["email": email]
        print(params)
        Alamofire.request(url!, method: .post, parameters: params, encoding: URLEncoding.queryString).responseJSON { (response) in
            completion(response)
            print("this is code= \(String(describing: response.response?.statusCode))")
        }
    }
}
