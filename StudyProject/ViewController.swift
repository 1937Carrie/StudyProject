//
//  ViewController.swift
//  StudyProject
//
//  Created by Stanislav on 31.01.2025.
//

import UIKit

class ViewController: UIViewController {

    let contentList = [
        ImageStringPair(image: UIImage(named: "Image"), description: "True story"),
        ImageStringPair(image: UIImage(named: "Image_1"), description: "What Are Stock Photos? (9 Examples & How to Use Them)"),
        ImageStringPair(image: UIImage(named: "Image_2"), description: "Young Businessman With Gun Pointed At Laptop Stock Photo"),
    ]

    @IBOutlet weak var imageMain: UIImageView!
    @IBOutlet weak var textImageDescription: UILabel!

    var currentContentNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

    private func setImageAndImageDescription(_ index: Int) {
        imageMain.image = contentList[index].image
        textImageDescription.text = contentList[index].description
    }
}
