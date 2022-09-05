//
//  Constants.swift
//  Cinemalust
//
//  Created by Muhammed Nadeem on 30/08/22.
//  Copyright © 2022 Genysis.inc. All rights reserved.
//

import Foundation
import UIKit


let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)


//Email regex
func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}

let USER_DEFAULTS = UserDefaults.standard

var USER_LOGGEDIN: Bool = false
