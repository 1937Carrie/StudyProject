//
//  EditorViewController.swift
//  StudyProject
//
//  Created by Stanislav on 04.02.2025.
//

import UIKit

class EditorViewController: UIViewController {

    @IBOutlet weak var imageMain: UIImageView!
    @IBOutlet weak var textFieldTitle: UITextView!
    @IBOutlet weak var textViewDescription: UITextView!

    var contentNumber: Int!
    var savePostCallback: ((Int) -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    @IBAction func setOnSaveButtonClickListener(_ sender: UIButton) {
        let edittedPost = Post(
            title: textFieldTitle.text ?? "",
            image: imageMain.image,
            description: textViewDescription.text
        )
        contentList[contentNumber] = edittedPost

        savePostCallback?(contentNumber)

        self.navigationController?.popViewController(animated: true)
    }

    fileprivate func setupView() {
        configureTextFieldTitle()
        configureDescriptionTextView()
        setImageAndImageDescription(contentNumber)
    }

    fileprivate func setImageAndImageDescription(_ index: Int) {
        textFieldTitle.text = contentList[index].title
        imageMain.image = contentList[index].image
        textViewDescription.text = contentList[index].description
    }

    fileprivate func configureDescriptionTextView() {
        textViewDescription.setRoundedCornerBorder()
    }

    fileprivate func configureTextFieldTitle() {
        textFieldTitle.setRoundedCornerBorder()
    }

}
