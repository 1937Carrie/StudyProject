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

private var textFieldObserverKey: UInt8 = 0

private var textViewObserverKey: UInt8 = 0

extension UITextView {
    func doOnTextChanged(_ handler: @escaping (String) -> Void) {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(textDidChangeNotification(_:)),
            name: UITextView.textDidChangeNotification,
            object: self
        )

        objc_setAssociatedObject(self, &textViewObserverKey, handler, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

    @objc private func textDidChangeNotification(_ notification: Notification) {
        guard let textView = notification.object as? UITextView,
              let handler = objc_getAssociatedObject(self, &textViewObserverKey) as? (String) -> Void else {
            return
        }
        handler(textView.text ?? "")
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

extension String {
    var isEmailAddress: Bool {
        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: self)
    }
}
