//
//  ViewController.swift
//  StudyProject
//
//  Created by Stanislav on 31.01.2025.
//

import UIKit

class ViewController: UIViewController {

    var contentList = [
        ImageStringPair(image: UIImage(named: "Image"), description: "True story"),
        ImageStringPair(image: UIImage(named: "Image_1"), description: "What Are Stock Photos? (9 Examples & How to Use Them)"),
        ImageStringPair(image: UIImage(named: "Image_2"), description: "Young Businessman With Gun Pointed At Laptop Stock Photo"),
    ]

    @IBOutlet weak var imageMain: UIImageView!
    @IBOutlet weak var textImageDescription: UITextView!
    @IBOutlet weak var textNewPost: UITextField!
    @IBOutlet weak var buttonEditOrSaveImageDescription: UIButton!

    var currentContentNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNewPostTextField()
        configureImageDescription()
        configureMainImage()
        setImageAndImageDescription(currentContentNumber)
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
        if !textImageDescription.isEditable {
            textImageDescription.isEditable = true
            buttonEditOrSaveImageDescription.setTitle("Save", for: .normal)

        } else {
            contentList[currentContentNumber] = ImageStringPair(image: contentList[currentContentNumber].image, description: textImageDescription.text)
            textImageDescription.isEditable = false
            buttonEditOrSaveImageDescription.setTitle("Edit", for: .normal)
        }
    }
    
    fileprivate func setImageAndImageDescription(_ index: Int) {
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

    fileprivate func configureNewPostTextField() {
        textNewPost.setRoundedCornerBorder()
    }
}
