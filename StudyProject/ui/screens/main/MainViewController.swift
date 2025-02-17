//
//  ViewController.swift
//  StudyProject
//
//  Created by Stanislav on 31.01.2025.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var textImageTitle: UILabel!
    @IBOutlet weak var imageMain: UIImageView!
    @IBOutlet weak var buttonPrevious: UIButton!
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var textImageDescription: UITextView!
    @IBOutlet weak var buttonEditOrSaveImageDescription: UIButton!

    var currentContentNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        hideKeyboardWhenTappedAround()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
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
            controller.savePostCallback = setImageAndImageDescription
        }
    }

    fileprivate func setupView() {
        setFonts()
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

    fileprivate func setFonts() {
        textImageTitle.font = UIFont(name: ImportedFonts.SFProText_Bold.rawValue, size: 15)
        buttonPrevious.titleLabel?.font = UIFont(name: ImportedFonts.SFProText_Bold.rawValue, size: 15)
        buttonNext.titleLabel?.font = UIFont(name: ImportedFonts.SFProText_Bold.rawValue, size: 15)
        labelDescription.font = UIFont(name: ImportedFonts.SFProText_Regular.rawValue, size: 12)
        textImageDescription.font = UIFont(name: ImportedFonts.SFProText_Bold.rawValue, size: 15)
    }

    fileprivate func configureImageDescription() {
        textImageDescription.setRoundedCornerBorder()
    }
}
