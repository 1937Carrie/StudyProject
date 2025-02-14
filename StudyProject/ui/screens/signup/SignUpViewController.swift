//
//  SignUpViewController.swift
//  StudyProject
//
//  Created by Stanislav on 06.02.2025.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldConfirmPassword: UITextField!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldSurname: UITextField!

    @IBOutlet weak var labelEmailError: UILabel!
    @IBOutlet weak var labelPasswordError: UILabel!
    @IBOutlet weak var labelPasswordConfirmationError: UILabel!
    @IBOutlet weak var labelNameError: UILabel!
    @IBOutlet weak var labelSurnameError: UILabel!

    @IBOutlet weak var constraintTextFieldEmailTop: NSLayoutConstraint!
    @IBOutlet weak var constraintButtonSignUpBotton: NSLayoutConstraint!

    private let viewModel = SignUpViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setListeners()
    }

    @IBAction func setOnSignUpClickListener(_ sender: UIButton) {
        let alertController = createAlertController(
            agreeAction: {
                // Add "Agree" action
                UIAlertAction(title: "Agree", style: .default) { _ in
                    self.performSegue(withIdentifier: "actionSignUpToMain", sender: nil)
                }
            },
            cancelAction: {
                // Add "Cancel" action
                UIAlertAction(title: "Cancel", style: .cancel) { _ in
                    print("User canceled the registration.")
                }
            }
        )

        let emailIsValid = viewModel.validateEmail(textFieldEmail.text ?? "")
        let passwordIsValid = viewModel.validatePassword(textFieldPassword?.text ?? "")
        let confirmationPasswordIsValid = viewModel.validateConfirmationPassword(confirmationPassword: textFieldConfirmPassword.text ?? "", originalPassword: textFieldPassword.text ?? "")
        let nameIsValid = viewModel.validateName(textFieldName?.text ?? "")
        let surnameIsValid = viewModel.validateSurname(textFieldSurname?.text ?? "")

        if emailIsValid &&
            passwordIsValid &&
            confirmationPasswordIsValid &&
            nameIsValid &&
            surnameIsValid {
            // Present the alert controller
            present(alertController, animated: true, completion: nil)
        } else {
            showEmailError(!emailIsValid)
            showPasswordError(!passwordIsValid)
            showConfirmationPasswordError(!confirmationPasswordIsValid)
            showNameError(!nameIsValid)
            showSurnameError(!surnameIsValid)
            showToast(message: "Please fill in the appropriate fields correctly")
        }
    }

    fileprivate func createAlertController(
        agreeAction: () -> UIAlertAction,
        cancelAction: () -> UIAlertAction
    ) -> UIAlertController {
        let alertController = UIAlertController(
            title: "User agreement",
            message: nil,
            preferredStyle: .alert
        )

        let textView = UITextView()
        textView.isEditable = false
        textView.isScrollEnabled = true
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.text = """
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
            Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
            nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in 
            reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla 
            pariatur. Excepteur sint occaecat cupidatat non proident, sunt in 
            culpa qui officia deserunt mollit anim id est laborum.
        """
        alertController.view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: alertController.view.topAnchor, constant: 60),
            textView.leadingAnchor.constraint(equalTo: alertController.view.leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: alertController.view.trailingAnchor, constant: -16),
            textView.bottomAnchor.constraint(equalTo: alertController.view.bottomAnchor, constant: -60),
            textView.heightAnchor.constraint(equalToConstant: 200) // Set a fixed height
        ])

        alertController.addAction(agreeAction())

        alertController.addAction(cancelAction())

        return alertController
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldEmail {
            textFieldPassword.becomeFirstResponder()
        } else if textField == textFieldPassword {
            textFieldConfirmPassword.becomeFirstResponder()
        } else if textField == textFieldConfirmPassword {
            textFieldName.becomeFirstResponder()
        } else if textField == textFieldName {
            textFieldSurname.becomeFirstResponder()
        } else if textField == textFieldSurname {
            textFieldSurname.resignFirstResponder()
        }
        return true
    }

    fileprivate func setListeners() {
        textFieldEmail.doOnTextChanged { email in
            self.showEmailError(!self.viewModel.validateEmail(email))
        }
        textFieldPassword.doOnTextChanged { password in
            self.showPasswordError(!self.viewModel.validatePassword(password))
        }
        textFieldConfirmPassword.doOnTextChanged { confirmationPassword in
            self.showConfirmationPasswordError(!self.viewModel.validateConfirmationPassword(confirmationPassword: confirmationPassword, originalPassword: self.textFieldPassword.text ?? ""))
        }
        textFieldName.doOnTextChanged { name in
            self.showNameError(!self.viewModel.validateName(name))
        }
        textFieldSurname.doOnTextChanged { surname in
            self.showSurnameError(!self.viewModel.validateSurname(surname))
        }
    }

    fileprivate func showSurnameError(_ state: Bool) {
        if state {
            self.labelSurnameError.isHidden = false
            self.labelSurnameError.text = "Surname can't be empty"
        } else {
            self.labelSurnameError.isHidden = true
        }
    }

    fileprivate func showNameError(_ state: Bool) {
        if state {
            self.labelNameError.isHidden = false
            self.labelNameError.text = "Name can't be empty"
        } else {
            self.labelNameError.isHidden = true
        }
    }

    fileprivate func showConfirmationPasswordError(_ state: Bool) {
        if state {
            self.labelPasswordConfirmationError.isHidden = false
            self.labelPasswordConfirmationError.text = "Passwords are not matching"
        } else {
            self.labelPasswordConfirmationError.isHidden = true
        }
    }

    fileprivate func showPasswordError(_ state: Bool) {
        if state {
            self.labelPasswordError.isHidden = false
            self.labelPasswordError.text = "Enter valid password"
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
        configureTextFieldEmailConstraintTop()
        configureButtonSigUpConstraintBottom()
        configureErrorLabelsVisibility()
        setImeActionsOnTextFields()
    }

    fileprivate func setImeActionsOnTextFields() {
        textFieldEmail.delegate = self
        textFieldPassword.delegate = self
        textFieldConfirmPassword.delegate = self
        textFieldName.delegate = self
        textFieldSurname.delegate = self

        textFieldEmail.returnKeyType = .next
        textFieldPassword.returnKeyType = .next
        textFieldConfirmPassword.returnKeyType = .next
        textFieldName.returnKeyType = .next
        textFieldSurname.returnKeyType = .done
    }

    fileprivate func configureErrorLabelsVisibility() {
        labelEmailError.isHidden = true
        labelPasswordError.isHidden = true
        labelPasswordConfirmationError.isHidden = true
        labelNameError.isHidden = true
        labelSurnameError.isHidden = true
    }

    fileprivate func configureButtonSigUpConstraintBottom() {
        let screenWidth = UIScreen.main.bounds.width

        if screenWidth <= 375 { // iPhone SE (3rd Gen)
            constraintButtonSignUpBotton.constant = 32
        } else { // Larger iPhones (like iPhone 16)
            constraintButtonSignUpBotton.constant = 86
        }
    }

    fileprivate func configureTextFieldEmailConstraintTop() {
        let screenWidth = UIScreen.main.bounds.width

        if screenWidth <= 375 { // iPhone SE (3rd Gen)
            constraintTextFieldEmailTop.constant = 64
        } else { // Larger iPhones (like iPhone 16)
            constraintTextFieldEmailTop.constant = 130
        }
    }
}
