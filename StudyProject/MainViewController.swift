//
//  ViewController.swift
//  StudyProject
//
//  Created by Stanislav on 31.01.2025.
//

import UIKit

class MainViewController: UIViewController, EditorViewControllerDelegate {

    @IBOutlet weak var textImageTitle: UILabel!
    @IBOutlet weak var imageMain: UIImageView!
    @IBOutlet weak var textImageDescription: UITextView!
    @IBOutlet weak var buttonEditOrSaveImageDescription: UIButton!

    var currentContentNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    @IBAction func setOnButtonPreviousClickListener(_ sender: UIButton) {
        if currentContentNumber > 0 {
            currentContentNumber -= 1
        } else {
            currentContentNumber = contentList.count - 1
        }
        setImageAndImageDescription(currentContentNumber)
    }

    @IBAction func setOnButtonNextClickListener(_ sender: UIButton) {
        if currentContentNumber < contentList.count - 1 {
            currentContentNumber += 1
        } else {
            currentContentNumber = 0
        }
        setImageAndImageDescription(currentContentNumber)
    }
    @IBAction func setOnSaveOrEditButtonClickListener(_ sender: UIButton) {
        performSegue(withIdentifier: "actionViewControllerToEditorViewController", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? EditorViewController {
            controller.contentNumber = currentContentNumber
            controller.delegate = self
        }
    }

    fileprivate func setupView() {
        configureImageDescription()
        configureMainImage()
        setImageAndImageDescription(currentContentNumber)
    }

    fileprivate func setImageAndImageDescription(_ index: Int) {
        textImageTitle.text = contentList[index].title
        imageMain.image = contentList[index].image
        textImageDescription.text = contentList[index].description
    }

    fileprivate func configureMainImage() {
        imageMain.layer.cornerRadius = 8
        imageMain.clipsToBounds = true
    }

    fileprivate func configureImageDescription() {
        textImageDescription.setRoundedCornerBorder()
    }

    func didUpdatePost(at index: Int) {
        setImageAndImageDescription(index)
    }
}
