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
