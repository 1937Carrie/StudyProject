//
//  ContactsViewController.swift
//  StudyProject
//
//  Created by Stanislav on 20.02.2025.
//

import UIKit

class ContactsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    fileprivate let viewModel = ContactsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        detailViewController.contactId = sender as? Int
    }

}

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getContactsSize()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell", for: indexPath) as! ContactTableViewCell

        let contact = viewModel.getContactById(id: indexPath.row)

        cell.imageViewPhoto.layer.cornerRadius = 4
        cell.imageViewPhoto.image = UIImage(named: contact.image)
        cell.labelName.text = contact.name

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactId = viewModel.getContactById(id: indexPath.row).id
        performSegue(withIdentifier: "actionContactsToDetail", sender: contactId)
    }

}

class ContactTableViewCell: UITableViewCell {
    @IBOutlet weak var imageViewPhoto: UIImageView!
    @IBOutlet weak var labelName: UILabel!
}
