//
//  ViewController.swift
//  Eventomorrow
//
//  Created by Nguyen Ngoc Son on 1/15/18.
//  Copyright © 2018 Nguyen Ngoc Son. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,LoginNormalView, LoginFacebookView{
    
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtForgetPassword: UILabel!
    
    var loginFacebookPresenter = LoginFacebookPresenter()
    var loginNormalPresenter: LoginNomalPresenter = LoginNomalPresenter()!
    
    
    func messageLoginFacebookSuccess(){}
    func messageUnauthorizedFacebook(){}
    func messageFobiddenFacebook(){}
    func messageServerErrorLogInFacebook(){}
    func messageCanNotGetFaceId(){}
    
    
    //////////
    func messageLoginSuccess() {
        
        print("Login Success")
    }
    
    func messageUnauthorizedAccount() {
        print("Unauthorized")
    }
    
    func messageFobiddenAccount() {
        print("FobbidenAcount")
    }
    
    func messageServerError() {
        print("serverError")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginNormalPresenter.actachView(self)
        self.loginFacebookPresenter.attachView(self)
        
        self.txtForgetPassword.text = NSLocalizedString("forgetPassword", comment:"")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnLoginAcount_Clicked(_ sender: UIButton) {
        let email = txtEmail.text!
        let password = txtPassword.text!
//        print("email: \(email) and password \(password)")
        self.loginNormalPresenter.handelLoginNormal(email: email, password: password)
        
    }
    
    
    @IBAction func btnLoginFacebook_Clicked(_ sender: UIButton) {
        self.loginFacebookPresenter.handleLoginFacebook(loginViewController: self)
    }
    
}
