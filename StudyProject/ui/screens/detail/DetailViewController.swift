//
//  DetailViewController.swift
//  StudyProject
//
//  Created by Stanislav on 20.02.2025.
//

import UIKit

class DetailViewController: UIViewController {

    var contactId: Int?

    @IBOutlet weak var imageViewPhoto: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    fileprivate let viewModel = DetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewsByContactId()
    }

    fileprivate func configureViewsByContactId() {
        let contact = viewModel.getContactById(id: contactId ?? -1)
        imageViewPhoto.image = UIImage(named: contact.image)
        imageViewPhoto.layer.cornerRadius = 1
        labelName.text = contact.name
    }

}
