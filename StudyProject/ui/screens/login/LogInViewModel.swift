//
//  LogInViewModel.swift
//  StudyProject
//
//  Created by Stanislav on 12.02.2025.
//

import Foundation

class LogInViewModel {
    func validateEmail(_ email: String) -> Bool {
        return if email.isEmailAddress { true } else { false }
    }
    func validatePassword(_ password: String) -> Bool {
        return if password.count > 6 { true } else { false }
    }
}
