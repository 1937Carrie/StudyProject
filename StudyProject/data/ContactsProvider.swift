//
//  ContactsProvider.swift
//  StudyProject
//
//  Created by Stanislav on 21.02.2025.
//

import Foundation

class ContactsProvider {
    fileprivate static var contacts: [Contact] = []

    static let emptyContact = Contact(id: -1, name: "Empty contact", image: "Image_placeholder")

    static func getContacts() -> [Contact] {
        if !contacts.isEmpty {
            return contacts
        } else {
            let images = ["photo_1", "photo_2", "photo_3"]
            for i in 0...9 {
                contacts.append(Contact(id: i, name: "Contact #\(i)", image: images[i % 3]))
            }

            return contacts
        }
    }
}
