//
//  LoginViewController.swift
//  Cinemalust
//
//  Created by Muhammed Nadeem on 29/08/22.
//  Copyright © 2022 Genysis.inc. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: CustomTextFieldView!
    @IBOutlet weak var passwrdTextField: CustomTextFieldView!
    @IBOutlet weak var loginBttn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        configurePassView()
        textfieldConfig()
        dummyLoginData()
    }

    private func setStyle(){
        emailTextField.textField.attributedPlaceholder = NSAttributedString(string: "Username or email", attributes: [ .foregroundColor: UIColor.gray, .font: UIFont(name: "Avenir Next", size: 14) as Any])
        emailTextField.eyeBttn.isHidden = true
        passwrdTextField.textField.isSecureTextEntry = true
        passwrdTextField.textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [ .foregroundColor: UIColor.gray, .font: UIFont(name: "Avenir Next", size: 14) as Any])
        loginBttn.layer.cornerRadius = 10
        loginBttn.enableStringAnimation()
    }
    
    private func configurePassView(){
        passwrdTextField.onClick = { value in
            if value{
                self.passwrdTextField.textField.isSecureTextEntry = false
                self.passwrdTextField.eyeBttn.setImage(UIImage(systemName: "eye.fill"), for: .normal)
            }else{
                self.passwrdTextField.textField.isSecureTextEntry = true
                self.passwrdTextField.eyeBttn.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            }
        }
    }
    
    func dummyLoginData(){
        emailTextField.textField.text = "test@gmail.com"
        passwrdTextField.textField.text = "1234567"
    }
    
    private func textfieldConfig(){
        emailTextField.textField.keyboardType = .emailAddress
        passwrdTextField.textField.keyboardType = .asciiCapable
    }
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        self.textFieldValidation()
    }
}

//MARK: Firebase Authentication
extension LoginViewController{
    
    private func textFieldValidation(){
        if passwrdTextField.textField.text != "" && emailTextField.textField.text != ""{
            if let password = passwrdTextField.textField.text, let username = emailTextField.textField.text {
                if password.count >= 6{
                    self.authorizeLogin(userId: username, password: password)
                }else{
                    self.alertWithNoAction(title: "Password must be greater than 6 digits")
                }
            }
        }
    }
    
    private func authorizeLogin(userId: String, password: String){
        Auth.auth().signIn(withEmail: userId, password: password) { [weak self] authResult, error in
            if let error = error as? NSError {
                switch AuthErrorCode(rawValue: error.code) {
                case .operationNotAllowed:
                    break
                case .userDisabled:
                    self?.alertWithNoAction(title: "User Disabled, Contact adminisrtator")
                    break
                case .wrongPassword:
                    self?.alertWithNoAction(title: "Wrong Password")
                    break
                case .invalidEmail:
                    self?.alertWithNoAction(title: "Wrong Email or username")
                    break
                case .userNotFound:
                    self?.alertWithNoAction(title: "User not Found")
                    break
                default:
                    print("Error: \(error.localizedDescription)")
                }
            }else{
                debugPrint("Login Success..")
                self?.movetoDashboard()
                USER_LOGGEDIN = true
            }
        }
    }
    
    private func movetoDashboard(){
        let dashboardVC = mainStoryboard.instantiateViewController(withIdentifier: "DashBoardViewController") as! DashBoardViewController
        navigationController?.pushViewController(dashboardVC, animated: true)
    }

}
