
import UIKit

class SignUpViewController: UIViewController, SignUpView, UITextViewDelegate {
  
    @IBOutlet weak var txtname: UITextField!
    @IBOutlet weak var txtmail: UITextField!
    @IBOutlet weak var txtphoneNumber: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtComfirmPassword: UITextField!
    var singUpPresenter:SignUpPresenter = SignUpPresenter()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.singUpPresenter.attachView(self)
        self.hideKeyboardWhenTappedAround()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //return keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtname{
            txtmail.becomeFirstResponder()
        }
        if textField == txtmail{
            txtphoneNumber.becomeFirstResponder()
        }
        if textField == txtphoneNumber{
            txtPassword.becomeFirstResponder()
        }
        if textField == txtPassword{
            txtComfirmPassword.becomeFirstResponder()
        }
        
        return true
    }
    
    //
 

    
    
    @IBAction func dangKy(_ sender: Any) {
        let checkValidate = CheckValidate()
        
        let name = txtname.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let email = txtname.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let phone = txtname.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let password = txtname.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let confirmPass = txtname.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if name.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty || confirmPass.isEmpty {
            print("Vui long nhap dau du cac field")
        }
        else{
            if !checkValidate.isValidEmail(testStr: email) {
                print("Email khong hop le")
            } else{
                if !checkValidate.validPhone(value: phone){
                    print("So dt khong hop le")
                } else {
                    if !checkValidate.isSamePassword(pass1: password, pass2: confirmPass){
                        print("Mat khau khong khop")
                    }
                    else{
                        let dangky = Register(email: email ,name: name ,password: password , phoneNumber: phone)
                        print("dangKy \(dangky)")
                        singUpPresenter.handelSignUp(register: dangky)
                        
                    }
                }
            }
        }
    }
    
    // Overide SignUpView
    func SignUpSuccess() {
        print("thanh cong")
    }
    
    func SignUpAcountExists() {
        print("tai khoan da ton tai")
    }
    
    func SignUpUnauthorized() {
        print("SignUpUnauthorized")
    }
    
    func SignUpForbidden() {
        print("SignUpForbidden")
    }
    
    func SignUpServerError() {
        print("SignUpServerError")
    }

}

//  Turn off Keyboard
extension UIViewController: UITextFieldDelegate {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
