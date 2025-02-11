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

    var contentNumber: Int!
    var savePostCallback: ((Int) -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()

        hideKeyboardWhenTappedAround()
        setupView()
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
