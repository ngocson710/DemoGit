//
//  LoginNomalPresenter.swift
//  DemoAlamofire
//
//  Created by Le Anh Dat on 1/16/18.
//  Copyright © 2018 Le Anh Dat. All rights reserved.
//

import Foundation

protocol LoginNormalView {
    func messageLoginSuccess()
    func messageUnauthorizedAccount()
    func messageFobiddenAccount()
    func messageServerError()
}

protocol LoginNormalPresenterImp {
     func handelLoginNormal(email:String, password:String)
}


class LoginNomalPresenter: LoginNormalPresenterImp{
    var loginNormalView: LoginNormalView?
    
    init?() {
    }
    
    func actachView(_ view: LoginNormalView) {
        self.loginNormalView = view
    }
    
    func handelLoginNormal(email: String, password: String ) {
        let loginNormalService = LoginNormalService()
        loginNormalService.checkLogin(email: email, password: password) { statusCode in
            guard let code = statusCode else { return }
            print("code \(code)")
            switch code {
            case 401:
                self.loginNormalView?.messageUnauthorizedAccount()
            case 403:
                self.loginNormalView?.messageFobiddenAccount()
            case 500:
                self.loginNormalView?.messageServerError()
            case 200:
                print("sdsdsd")
                self.loginNormalView?.messageLoginSuccess()
            default:
                print("ahefr")
            }
        }
        
//        let code = loginNormalService.checkLogin(email: email, password: password)
//        print(code)
//        switch code {
//        case "401":
//            print("Unauthorized")
//        case "403":
//            print("Forbiden")
//        case "500":
//            print("server")
//        case "200":
//            print("success")
//        default:
//            print("ahefr")
//        }
    }
    
    
}

