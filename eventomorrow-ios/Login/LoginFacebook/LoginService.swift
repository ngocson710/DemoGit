//
//  LoginService.swift
//  eventomorrow-ios
//
//  Created by Vo The Dong An on 1/16/18.
//  Copyright © 2018 Nguyen Ngoc Son. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import FBSDKCoreKit
import FBSDKLoginKit

public class LoginFacebookService {
    
    static let shared = LoginFacebookService()
    var profile: Profile?
    var user: User?

    func checkLoginFB() -> Bool {
        if let _ = FBSDKAccessToken.current(){
            return true
        } else {
            return false
        }
    }
    
    func loginByFacebook(loginViewController: LoginViewController){
        let fbLoginManager = FBSDKLoginManager()
        if checkLoginFB() {
            fbLoginManager.logOut()
        } else {
            fbLoginManager.logIn(withReadPermissions: ["email"], from: loginViewController){ (loginResult,err)  in
                if(err == nil){
                    let fbLoginResult: FBSDKLoginManagerLoginResult = loginResult!
                    if let _ = fbLoginResult.grantedPermissions {
                        if let accessToken = FBSDKAccessToken.current(){
                            if let token = accessToken.tokenString {
                                print("token post \(token)")
                                let parameters: [String: String] = [
                                    "accessToken" : token
                                ]
                                Alamofire.request(Constants.LOGIN_BY_FB, method: .post, parameters: parameters, encoding: JSONEncoding.default)
                                    .responseJSON { response in
                                        switch response.result {
                                        case .failure(let error):
                                            print("login failed with error \(error)")
                                        case .success(let data):
                                            let json = JSON(data)
                                            self.profile = Profile(dict: json["profile"])
                                            guard let profile = self.profile else { return }
                                            self.user = User(profile: profile, token: json["token"])
                                            print("aa: \(self.user?.token)")
                                        }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
