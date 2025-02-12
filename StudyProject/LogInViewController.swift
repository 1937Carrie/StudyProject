//
//  LogInViewController.swift
//  StudyProject
//
//  Created by Stanislav on 06.02.2025.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!

    @IBOutlet weak var constraintButtonGoToSignUpBottom: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        hideKeyboardWhenTappedAround()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    @IBAction func setOnLoginClickListener(_ sender: UIButton) {
        let emailIsFilled = !(textFieldEmail.text?.isEmpty ?? true)
        let passwordIsFilled = !(textFieldPassword.text?.isEmpty ?? true)
        if emailIsFilled && passwordIsFilled {
            performSegue(withIdentifier: "actionLogInToMain", sender: nil)
        } else {
            showToast(message: "Please fill in the appropriate fields correctly")
        }

    }

    @IBAction func setOnSignUpClickListener(_ sender: UIButton) {
        performSegue(withIdentifier: "actionLogInToSignUp", sender: nil)
    }

    fileprivate func setupView() {
        // configureTextFieldEmail()

        configureConstraintsBottom()
    }

    fileprivate func configureConstraintsBottom() {
        let screenWidth = UIScreen.main.bounds.width

        if screenWidth <= 375 { // iPhone SE (3rd Gen)
            constraintButtonGoToSignUpBottom.constant = 32
        } else { // Larger iPhones (like iPhone 16)
            constraintButtonGoToSignUpBottom.constant = 136
        }
    }

    fileprivate func configureTextFieldEmail() {
        textFieldEmail.setRoundedCornerBorder()
    }

}
