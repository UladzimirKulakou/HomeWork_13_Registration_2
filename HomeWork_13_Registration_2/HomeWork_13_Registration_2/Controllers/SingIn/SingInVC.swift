//
//  SingInVC.swift
//  HomeWork_13_Registration_2
//
//  Created by Владимир  on 6/27/21.
//  Copyright © 2021 Владимир . All rights reserved.
//

import UIKit

class SingInVC: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var userErrorLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func emailTFChanged(_ sender: UITextField) {
    }
    
    @IBAction func passTFChanged(_ sender: UITextField) {
    }
    
    @IBAction func signinTapped() {
        guard let email = emailTF.text,
            let pass = passTF.text else {return}
        if checkUser(email: email, pass: pass) {
            print("go to next VC after registrat")
        }
    }
    
    private func checkUser(email: String, pass: String) -> Bool {
       
        let emailSaved = UserDefaults.standard.object(forKey: Constants.email) as! String
        let passSaved = UserDefaults.standard.object(forKey: Constants.pass) as! String
        let userFound = (email == emailSaved) && (pass == passSaved)
        userErrorLbl.isHidden = userFound
       return  userFound
    }
    
}
