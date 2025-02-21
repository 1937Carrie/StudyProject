//
//  DetailViewModel.swift
//  StudyProject
//
//  Created by Stanislav on 20.02.2025.
//

import Foundation

class DetailViewModel {
    fileprivate let contacts = ContactsProvider.getContacts()

    func getContactById(id: Int) -> Contact {
        if id == -1 { return ContactsProvider.emptyContact }

        return contacts.first { contact in
            contact.id == id
        } ?? ContactsProvider.emptyContact
    }
}
