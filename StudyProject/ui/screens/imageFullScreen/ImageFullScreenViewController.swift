//
//  ImageFullScreenViewController.swift
//  StudyProject
//
//  Created by Stanislav on 21.02.2025.
//

import UIKit

class ImageFullScreenViewController: UIViewController {

    var imageId: Int?

    @IBOutlet weak var image: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()

        image.image = if let gottenImageId = imageId {
            UIImage(named: images[gottenImageId % images.count])
        } else {
            UIImage(named: "Image_placeholder")
        }
    }

}
