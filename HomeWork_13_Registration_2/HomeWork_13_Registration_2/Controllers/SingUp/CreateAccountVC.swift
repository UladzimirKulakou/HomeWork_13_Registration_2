//
//  CreateAccountVC.swift
//  HomeWork_13_Registration_2
//
//  Created by Владимир  on 6/29/21.
//  Copyright © 2021 Владимир . All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var emailErrorLbl: UILabel!

    @IBOutlet weak var nameTF: UITextField!

    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var passErrorLbl: UILabel!

    @IBOutlet var verificationPassView: [UIView]!
    @IBOutlet weak var confirmPassTF: UITextField!
    @IBOutlet weak var confirmErrorLbl: UILabel!

    @IBOutlet weak var singUpButton: UIButton!

    private var isValidEmail = false
    private var passwordStranght: PasswordStrangth = .veryWeak

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
    @IBAction func singInButtonTouch() {
        navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func emailTFChanged(_ sender: UITextField) {
        guard let email = sender.text else { return }
        isValidEmail = VerificationService.isValidEmail(email: email)
        emailErrorLbl.isHidden = isValidEmail
    }

    @IBAction func nameTFChanged(_ sender: UITextField) {
    }

    @IBAction func passTFChenged(_ sender: UITextField) {
        guard let pass = sender.text else { return }
        passwordStranght = VerificationService.isValidPassword(pass: pass)
        passErrorLbl.isHidden = !(passwordStranght == .veryWeak)
        verificationPassView.enumerated().forEach{(index, view) in
            if index <= (passwordStranght.rawValue - 1) {
                view.alpha = 1
            } else {
                view.alpha = 0.3
            }
        }
    }

    @IBAction func confirmpassTFChanged(_ sender: UITextField) {
    }


}
