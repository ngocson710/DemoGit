//
//  ForgetPasswordViewController.swift
//  eventomorrow-ios
//
//  Created by Nguyen Ngoc Son on 1/22/18.
//  Copyright © 2018 Nguyen Ngoc Son. All rights reserved.
//

import UIKit

class ForgetPasswordViewController: UIViewController, ForgetPasswordView, UITextFieldDelegate {
    
    let forgetPasswordPresent = ForgetPasswordPresenter()

    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var txtEmail: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.forgetPasswordPresent?.attachView(self)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //return keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//       
        if textField == txtEmail{
            txtEmail.becomeFirstResponder()
        }
        textField.resignFirstResponder()
        return true
    }
    
    
    //check error email
    var checkmail = false
    @IBAction func handleErrEmail(_ sender: Any) {
        let checkValidate:CheckValidate = CheckValidate()
        let email = txtEmail.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if (email?.isEmpty)! {
            print("Name empty")
            lblEmail.text = "Type your Email!"
            self.checkmail = false
        } else{
            if !checkValidate.isValidEmail(testStr: email!){
                lblEmail.text = "Wrong format!"
                self.checkmail = false
                print("not correct")
            } else {
                lblEmail.text = ""
                self.checkmail = true
            }
        }
    }
    
    //handle Tab keyboard
    @IBAction func handleHideKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    

    @IBAction func btnReset(_ sender: Any) {
        let checkValidate:CheckValidate = CheckValidate()
        let email = txtEmail.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if (email?.isEmpty)! {
            print("Name empty")
            lblEmail.text = "Type your Email!"
            self.checkmail = false
        } else{
            if !checkValidate.isValidEmail(testStr: email!){
                lblEmail.text = "Wrong format!"
                self.checkmail = false
                print("not correct")
            } else {
                LoadingOverlay.shared.show(view: self.view)
                forgetPasswordPresent?.handelForgetPassword(email: email!)
            }
        }
    }
    
    func ForgetFailure() {
        print("failure....")
        LoadingOverlay.shared.hide()
    }

    func ForgetPasswordSuccess() {
        LoadingOverlay.shared.hide()
        let alert = UIAlertController(title: "Success!", message: "Request send to email, please check your email", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func ForgetPasswordAcountDontExists() {
        let alert = UIAlertController(title: "Error", message: "Account don't exists", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        LoadingOverlay.shared.hide()
    }

    func ForgetPasswordUnauthorized() {
        let alert = UIAlertController(title: "Error", message: "ForgetPasswordUnauthorized", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        LoadingOverlay.shared.hide()
    }

    func ForgetPasswordForbidden() {
        let alert = UIAlertController(title: "Error", message: "ForgetPasswordForbidden", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        LoadingOverlay.shared.hide()
    }

    func ForgetPasswordServerError() {
        let alert = UIAlertController(title: "Error", message: "ForgetPasswordServerError", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        LoadingOverlay.shared.hide()
    }
}

