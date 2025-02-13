//
//  SignUpViewController.swift
//  StudyProject
//
//  Created by Stanislav on 06.02.2025.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldConfirmPassword: UITextField!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldSurname: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

        let emailIsFilled = !(textFieldEmail?.text?.isEmpty ?? true)
        let passwordIsFilled = !(textFieldPassword?.text?.isEmpty ?? true)
        let confirmPasswordIsFilled = !(textFieldConfirmPassword?.text?.isEmpty ?? true)
        let namelIsFilled = !(textFieldName?.text?.isEmpty ?? true)
        let surnameIsFilled = !(textFieldSurname?.text?.isEmpty ?? true)

        if emailIsFilled &&
            passwordIsFilled &&
            confirmPasswordIsFilled &&
            namelIsFilled &&
            surnameIsFilled {
            // Present the alert controller
            present(alertController, animated: true, completion: nil)
        } else {
            showToast(message: "Please fill in the appropriate fields correctly")
        }
    }

    fileprivate func createAlertController(
        agreeAction: () -> UIAlertAction,
        cancelAction: () -> UIAlertAction
    ) -> UIAlertController{
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
}
