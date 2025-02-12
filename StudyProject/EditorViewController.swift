//
//  EditorViewController.swift
//  StudyProject
//
//  Created by Stanislav on 04.02.2025.
//

import UIKit

class EditorViewController: UIViewController {

    @IBOutlet weak var imageMain: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textViewImageTitle: UITextView!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var textViewImageDescription: UITextView!
    @IBOutlet weak var buttonSave: UIButton!

    @IBOutlet weak var constraintBottomTextViewImageDescription: NSLayoutConstraint!

    var contentNumber: Int!
    var savePostCallback: ((Int) -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()

        hideKeyboardWhenTappedAround()
        setupView()

        // Register for keyboard notifications
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    deinit {
        // Remove observers when the view controller is deallocated
        NotificationCenter.default.removeObserver(self)
    }

    @objc func keyboardWillShow(_ notification: Notification) {
        // Get the keyboard height
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            let keyboardHeight = keyboardFrame.height

            // Adjust the bottom constraint to move the TextView above the keyboard
            constraintBottomTextViewImageDescription.constant = keyboardHeight - view.safeAreaInsets.bottom

            // Animate the constraint change
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        // Restore the bottom constraint to its original value
        constraintBottomTextViewImageDescription.constant = 29

        // Animate the constraint change
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

    @IBAction func setOnSaveButtonClickListener(_ sender: UIButton) {
        let edittedPost = Post(
            title: textViewImageTitle.text ?? "",
            image: imageMain.image,
            description: textViewImageDescription.text
        )
        contentList[contentNumber] = edittedPost

        savePostCallback?(contentNumber)

        self.navigationController?.popViewController(animated: true)
    }

    fileprivate func setupView() {
        setFonts()
        configureTextFieldTitle()
        configureDescriptionTextView()
        setImageAndImageDescription(contentNumber)
    }

    fileprivate func setImageAndImageDescription(_ index: Int) {
        textViewImageTitle.text = contentList[index].title
        imageMain.image = contentList[index].image
        textViewImageDescription.text = contentList[index].description
    }

    fileprivate func configureDescriptionTextView() {
        textViewImageDescription.setRoundedCornerBorder()
    }

    fileprivate func configureTextFieldTitle() {
        textViewImageTitle.setRoundedCornerBorder()
    }

    fileprivate func setFonts() {
        labelTitle.font = UIFont(name: ImportedFonts.SFProText_Regular.rawValue, size: 12)
        textViewImageTitle.font = UIFont(name: ImportedFonts.SFProText_Bold.rawValue, size: 15)
        labelDescription.font = UIFont(name: ImportedFonts.SFProText_Regular.rawValue, size: 12)
        textViewImageDescription.font = UIFont(name: ImportedFonts.SFProText_Bold.rawValue, size: 15)
        buttonSave.titleLabel?.font = UIFont(name: ImportedFonts.SFProText_Bold.rawValue, size: 15)
    }
}
