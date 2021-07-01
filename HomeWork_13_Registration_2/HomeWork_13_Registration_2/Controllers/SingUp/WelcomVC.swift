//
//  WelcomVC.swift
//  HomeWork_13_Registration_2
//
//  Created by Владимир  on 6/30/21.
//  Copyright © 2021 Владимир . All rights reserved.
//

import UIKit

class WelcomVC: UIViewController {
    
    var email: String?
    var name: String?
    var pass: String?

    @IBAction func continueButtonTapped() {
        guard let email = email,
                       let pass = pass,
                       let name = name else {return}
        UserDefaults.standard.set(name, forKey: Constants.name)
        UserDefaults.standard.set(email, forKey: Constants.email)
        UserDefaults.standard.set(pass, forKey: Constants.pass)
        navigationController?.popViewController(animated: true)
    }
    
}
