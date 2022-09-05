//
//  ProfileViewController.swift
//  Cinemalust
//
//  Created by Muhammed Nadeem on 31/08/22.
//  Copyright © 2022 Genysis.inc. All rights reserved.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var logoutBttn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
    }
    
    private func setStyle(){
        logoutBttn.layer.cornerRadius = 10
    }

    @IBAction func backButton(_ sender: Any) {
        self.dismissVC()
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.moveToPreloginScreen()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    private func moveToPreloginScreen(){
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LandingViewController") as! LandingViewController
        USER_LOGGEDIN = false
        navigationController?.pushViewController(viewController, animated: true)
    }
}
