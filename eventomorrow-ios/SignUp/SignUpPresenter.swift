//
//  SignUpPresenter.swift
//  eventomorrow-ios
//
//  Created by Nguyen Ngoc Son on 1/17/18.
//  Copyright © 2018 Nguyen Ngoc Son. All rights reserved.
//

import Foundation

protocol SignUpPresenterImp {
    func handelSignUp(register:Register)
}

protocol SignUpView {
    func SignUpSuccess()
    func SignUpAcountExists()
    func SignUpUnauthorized()
    func SignUpForbidden()
    func SignUpServerError()
}

class SignUpPresenter: SignUpPresenterImp {
    var signUpView:SignUpView?
    
    init?() {
    }
    
    func attachView(_ view: SignUpView) {
        self.signUpView=view
    }
    
    let sinUpServices = SinUpServices()
    func handelSignUp(register: Register) {
        sinUpServices.getDataSignUp(register: register) { result in
            switch result{
            case 200:
                self.signUpView?.SignUpSuccess()
            case 400:
                self.signUpView?.SignUpAcountExists()
            case 401:
                self.signUpView?.SignUpUnauthorized()
            case 403:
                self.signUpView?.SignUpForbidden()
            case 500:
                self.signUpView?.SignUpServerError()
            default:
                print("default")
            }
        }
    }
}
