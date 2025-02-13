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
    @IBOutlet weak var labelEmailError: UILabel!
    @IBOutlet weak var labelPasswordError: UILabel!

    @IBOutlet weak var constraintButtonGoToSignUpBottom: NSLayoutConstraint!

    private let viewModel = LogInViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        hideKeyboardWhenTappedAround()
        setupView()
        setListeners()
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
        let emailIsFilled = viewModel.validateEmail(textFieldEmail.text ?? "")
        let passwordIsFilled = viewModel.validatePassword(textFieldPassword.text ?? "")
        if emailIsFilled && passwordIsFilled {
            performSegue(withIdentifier: "actionLogInToMain", sender: nil)
        } else {
            if !emailIsFilled {
                showEmailError(true)
            }
            if !passwordIsFilled {
                showPasswordError(true)
            }
            showToast(message: "Please fill in the appropriate fields correctly")
        }
    }

    @IBAction func setOnSignUpClickListener(_ sender: UIButton) {
        performSegue(withIdentifier: "actionLogInToSignUp", sender: nil)
    }

    fileprivate func setListeners() {
        textFieldEmail.doOnTextChanged { email in
            self.showEmailError(!self.viewModel.validateEmail(email))
        }
        textFieldPassword.doOnTextChanged { password in
            self.showPasswordError(!self.viewModel.validatePassword(password))
        }
    }

    fileprivate func showPasswordError(_ state: Bool) {
        if state {
            self.labelPasswordError.isHidden = false
            self.labelPasswordError.text = "Password length should be greater than 6"
        } else {
            self.labelPasswordError.isHidden = true
        }
    }

    fileprivate func showEmailError(_ state: Bool) {
        if state {
            self.labelEmailError.isHidden = false
            self.labelEmailError.text = "Enter valid email"
        } else {
            self.labelEmailError.isHidden = true
        }
    }

    fileprivate func setupView() {
        // configureTextFieldEmail()
        labelEmailError.isHidden = true
        labelPasswordError.isHidden = true

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
