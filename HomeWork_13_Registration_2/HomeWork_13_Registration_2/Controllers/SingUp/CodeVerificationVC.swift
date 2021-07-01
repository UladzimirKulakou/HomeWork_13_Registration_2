//
//  CodeVerificationVC.swift
//  HomeWork_13_Registration_2
//
//  Created by Владимир  on 6/30/21.
//  Copyright © 2021 Владимир . All rights reserved.
//

import UIKit

class CodeVerificationVC: UIViewController {
    
    var generatorPassCode: String {
        let pass = Int.random(in: 10000...99999)
        return String(pass)
    }
    
    var passCode: String?
    
    
    var email: String?
    var name: String?
    var pass: String?
    
    @IBOutlet weak var codeSecretLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passCode = generatorPassCode
        setUpUI()
        

        // Do any additional setup after loading the view.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       guard let email = email,
                 let pass = pass,
                 let name = name,
                 let destVC = segue.destination as? WelcomVC else {return}
             destVC.name = name
             destVC.email = email
             destVC.pass = pass
    }

    @IBAction func codeTFChanged(_ sender: UITextField) {
        guard let code = passCode,
            let ourCode = sender.text else { return }
        if isCodeValid(code: code, ourCode: ourCode) {
           performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        
    }
    
    private func setUpUI() {
        
        codeSecretLbl.text = (passCode ?? "dd") + " from \(email ?? "")"
    }
    
    private func isCodeValid(code: String, ourCode: String) -> Bool{
        
        
        return code == ourCode
    }
}
