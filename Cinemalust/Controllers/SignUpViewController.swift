//
//  SignUpViewController.swift
//  Cinemalust
//
//  Created by Muhammed Nadeem on 29/08/22.
//  Copyright © 2022 Genysis.inc. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameTextFieldView: CustomTextFieldView!
    @IBOutlet weak var emailTextFieldView: CustomTextFieldView!
    @IBOutlet weak var passwordTextFieldView: CustomTextFieldView!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        signUpButton.layer.cornerRadius = 10
        nameTextFieldView.eyeBttn.isHidden = true
        emailTextFieldView.eyeBttn.isHidden = true
        emailTextFieldView.textField.keyboardType = .emailAddress
        passwordTextFieldView.eyeBttn.isHidden = true
        passwordTextFieldView.textField.isSecureTextEntry = true
        
        nameTextFieldView.textField.attributedPlaceholder = NSAttributedString(string: "Enter your Name", attributes: [ .foregroundColor: UIColor.gray, .font: UIFont(name: "Baskerville", size: 14) as Any])
        emailTextFieldView.textField.attributedPlaceholder = NSAttributedString(string: "Enter your Email", attributes: [ .foregroundColor: UIColor.gray, .font: UIFont(name: "Baskerville", size: 14) as Any])
        passwordTextFieldView.textField.attributedPlaceholder = NSAttributedString(string: "Enter Password", attributes: [ .foregroundColor: UIColor.gray, .font: UIFont(name: "Baskerville", size: 14) as Any])
    }
    
    
    @IBAction func loginwithApple(_ sender: UIButton) {
        debugPrint("Appleid")
    }
    
    @IBAction func googleBttn(_ sender: UIButton) {
        debugPrint("Google")
    }
    
    @IBAction func fbButton(_ sender: UIButton) {
        debugPrint("facebook")
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        self.dismissVC()
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        self.textFieldValidation()
    }
}


//MARK: Firebase Authentication
extension SignUpViewController{
    
    private func textFieldValidation(){
        if let userName = nameTextFieldView.textField.text, let email = emailTextFieldView.textField.text, let passowrd = passwordTextFieldView.textField.text{
            let ValidEmail = isValidEmail(email)
            if ValidEmail == true && passowrd.count >= 6{
                self.doFirebaseSignUp(email: email, password: passowrd)
                USER_DEFAULTS.set(userName, forKey: "username")
            }
        }
    }
    
    private func doFirebaseSignUp(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error{
                print(error)
            }else{
                debugPrint("User created successfully")
                //move to dashboard
                self.movetoDashboard()
            }
        }
    }
    
    private func movetoDashboard(){
        let dashboardVC = mainStoryboard.instantiateViewController(withIdentifier: "DashBoardViewController") as! DashBoardViewController
        navigationController?.pushViewController(dashboardVC, animated: true)
    }
}
