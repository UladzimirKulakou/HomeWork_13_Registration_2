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
    @IBOutlet weak var scrollView: UIScrollView!

    private var isValidEmail = false
    private var isConfPass = false
    private var passwordStranght: PasswordStrangth = .veryWeak

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.startKeyboardObserver()
    }


    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let email = emailTF.text,
            let pass = passTF.text,
            let name = nameTF.text,
            let destVC = segue.destination as? CodeVerificationVC else { return }
        destVC.name = name
        destVC.email = email
        destVC.pass = pass
    }

    @IBAction func singInButtonTouch() {
        navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func emailTFChanged(_ sender: UITextField) {
        guard let email = sender.text else { return }
        isValidEmail = VerificationService.isValidEmail(email: email)
        emailErrorLbl.isHidden = isValidEmail
        updateButtonState()
    }

    @IBAction func nameTFChanged(_ sender: UITextField) {
    }

    @IBAction func passTFChenged(_ sender: UITextField) {
        guard let pass1 = sender.text else { return }
        passwordStranght = VerificationService.isValidPassword(pass: pass1)
        passErrorLbl.isHidden = !(passwordStranght == .veryWeak)
        verificationPassView.enumerated().forEach { (index, view) in
            if index <= (passwordStranght.rawValue - 1) {
                view.alpha = 1
            } else {
                view.alpha = 0.3
            }
        }

        guard let pass2 = confirmPassTF.text else { return }
        updatePassErrorLbl(pass1: pass1, pass2: pass2)

        updateButtonState()
    }

    @IBAction func confirmpassTFChanged(_ sender: UITextField) {
        guard let pass1 = sender.text,
            let pass2 = passTF.text else { return }
        updatePassErrorLbl(pass1: pass1, pass2: pass2)
        isConfPass = VerificationService.isPassConfirm(pass1: pass1, pass2: pass2)
        confirmErrorLbl.isHidden = isConfPass
        updateButtonState()
    }

    private func updatePassErrorLbl (pass1: String, pass2: String) {
        isConfPass = VerificationService.isPassConfirm(pass1: pass1, pass2: pass2)
        confirmErrorLbl.isHidden = isConfPass
    }
    private func updateButtonState() {
        singUpButton.isEnabled = isValidEmail && isConfPass && (passwordStranght != .veryWeak)
        if singUpButton.isEnabled == true {
            singUpButton.alpha = 1
        } else {
            singUpButton.alpha = 0.4
        }
    }
    @IBAction func singUpTouch(_ sender: UIButton) {
        performSegue(withIdentifier: "showCodeVerVC", sender: nil)
    }
    private func startKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(CreateAccountVC.keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(CreateAccountVC.keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)

    }
    @objc func keyboardWillShow(notification: Notification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets

    }
    @objc func keyboardWillHide(notification: Notification) {
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets

    }
}
