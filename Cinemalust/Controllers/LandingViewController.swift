//
//  LandingViewController.swift
//  Cinemalust
//
//  Created by Muhammed Nadeem on 28/08/22.
//

import UIKit

class LandingViewController: UIViewController {

    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var buttonContainerView: UIView!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var signupbttnLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupScreen()
        DispatchQueue.main.async {
            self.gradientLayer()
        }
        navigationController?.isNavigationBarHidden = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func viewDidLayoutSubviews() {
        buttonContainerView.clipsToBounds = true
    }
    
    private func setupScreen(){
        backgroundImg.image = UIImage(named: "landingbackground")
        LoginButton.backgroundColor = .white
        LoginButton.layer.cornerRadius = 15
        LoginButton.enableStringAnimation()
        
        //SignUpButton
        let buttonText = getStyledMssg(mssg1: "Register", mssg2: "Don't have an account? ")
        signupbttnLbl.attributedText = buttonText
    }
    
    func getStyledMssg(mssg1: String, mssg2: String) -> NSMutableAttributedString{
        let attributedText1 = NSMutableAttributedString(string: mssg1, attributes: [NSAttributedString.Key.font: UIFont(name: "Baskerville Bold", size: 15)!, NSAttributedString.Key.foregroundColor : UIColor.white])
        let attributedText2 = NSMutableAttributedString(string: mssg2, attributes: [NSAttributedString.Key.font: UIFont(name: "Baskerville", size: 15)!, NSAttributedString.Key.foregroundColor : UIColor.white])
        attributedText2.append(attributedText1)
        return attributedText2
    }

    func gradientLayer(){
        let view = UIView(frame: gradientView.frame)
        let gradient = CAGradientLayer()
        gradient.frame = view.frame
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.0, 0.59]
        view.layer.insertSublayer(gradient, at: 0)
        backgroundImg.addSubview(view)
        backgroundImg.bringSubviewToFront(view)
    }
    

    @IBAction func loginAction(_ sender: UIButton) {
        let loginVC = mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @IBAction func sigupAction(_ sender: UIButton) {
        let signUpVC = mainStoryboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
}

