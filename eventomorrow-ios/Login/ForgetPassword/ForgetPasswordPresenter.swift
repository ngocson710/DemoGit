//
//  ForgetPasswordPresenter.swift
//  eventomorrow-ios
//
//  Created by Nguyen Ngoc Son on 1/22/18.
//  Copyright © 2018 Nguyen Ngoc Son. All rights reserved.
//

import Foundation

protocol ForgetPasswordPresenterImp {
    func handelForgetPassword(email:String)
}

protocol ForgetPasswordView {
    func ForgetFailure()
    func ForgetPasswordSuccess()
    func ForgetPasswordAcountDontExists()
    func ForgetPasswordUnauthorized()
    func ForgetPasswordForbidden()
    func ForgetPasswordServerError()
}

class ForgetPasswordPresenter: ForgetPasswordPresenterImp {
    
    var forgetPasswordView:ForgetPasswordView?
    init?() {
    }
    
    func attachView(_ view: ForgetPasswordView) {
        self.forgetPasswordView=view
    }
    let forgetPasswordService = ForgetPasswordService()
    
    func handelForgetPassword(email: String) {
        forgetPasswordService.getDataForgetPassword(email: email) { (response) in
            let code:Int = (response.response?.statusCode)!
            switch code{
            case 200:
                self.forgetPasswordView?.ForgetPasswordSuccess()
            case 400:
                self.forgetPasswordView?.ForgetPasswordAcountDontExists()
            case 401:
                self.forgetPasswordView?.ForgetPasswordUnauthorized()
            case 403:
                self.forgetPasswordView?.ForgetPasswordForbidden()
            case 500:
                self.forgetPasswordView?.ForgetPasswordServerError()
            default:
                self.forgetPasswordView?.ForgetFailure()
            }
    }

    }
    
}

