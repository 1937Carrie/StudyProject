//
//  Util.swift
//  StudyProject
//
//  Created by Stanislav on 03.02.2025.
//

import UIKit

extension UIView {
    func setRoundedCornerBorder() {
        self.layer.borderColor = UIColor(named: "MainBlue")?.withAlphaComponent(0.3).cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 8
    }
}

extension UIViewController {
    func showToast(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        present(alertController, animated: true) {
            // Dismiss the alert after a delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                alertController.dismiss(animated: true, completion: nil)
            }
        }
    }

    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
