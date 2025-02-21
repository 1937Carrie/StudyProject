//
//  ContactsViewModel.swift
//  StudyProject
//
//  Created by Stanislav on 20.02.2025.
//

import Foundation

class ContactsViewModel {
    fileprivate let contacts = ContactsProvider.getContacts()

    func getContactsSize() -> Int {
        return contacts.count
    }

    func getContactById(id: Int) -> Contact {
        if id == -1 { return ContactsProvider.emptyContact }

        return contacts.first { contact in
            contact.id == id
        } ?? ContactsProvider.emptyContact
    }
}
