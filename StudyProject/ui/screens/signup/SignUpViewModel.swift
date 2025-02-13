//
//  SignUpViewModel.swift
//  StudyProject
//
//  Created by Stanislav on 13.02.2025.
//

import Foundation

class SignUpViewModel {
    func validateEmail(_ email: String) -> Bool {
        return if email.isEmailAddress { true } else { false }
    }

    func validatePassword(_ password: String) -> Bool {
        return if password.count > 6 { true } else { false }
    }

    func validateConfirmationPassword(confirmationPassword: String, originalPassword: String) -> Bool {
        return originalPassword == confirmationPassword
    }

    func validateName(_ name: String) -> Bool {
        return !name.isEmpty
    }

    func validateSurname(_ surname: String) -> Bool {
        return !surname.isEmpty
    }
}
