//
//  LoginPresenter.swift
//  eventomorrow-ios
//
//  Created by Vo The Dong An on 1/16/18.
//  Copyright © 2018 Nguyen Ngoc Son. All rights reserved.
//

import Foundation
protocol LoginFacebookView{
    func messageLoginFacebookSuccess()
    func messageUnauthorizedFacebook()
    func messageFobiddenFacebook()
    func messageServerErrorLogInFacebook()
    func messageCanNotGetFaceId()
}


protocol LoginPresenterFacebookProtocol{
    func handleLoginFacebook(loginViewController: LoginViewController)
}


class LoginFacebookPresenter: LoginPresenterFacebookProtocol {
    
    fileprivate var loginView:LoginFacebookView?
    
    func handleLoginFacebook(loginViewController: LoginViewController) {
        LoginFacebookService.shared.loginByFacebook(loginViewController: loginViewController)
        guard let token = LoginFacebookService.shared.user?.token else {
            return
        }
        print("Token Response: \(token)")
    }
    
    func attachView(_ view: LoginFacebookView){
        loginView = view
    }
}
