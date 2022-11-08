//
//  MainViewModel.swift
//  AirContacts
//
//  Created by Piotr Waś on 04/11/2022.
//

import SwiftUI
import Contacts

class MainViewModel: ObservableObject {
    let manager = LocalFileManager.instance
    
    func fetchContacts() -> [CNContact] {
        var contacts = [CNContact]()
        
        let contactStore = CNContactStore()
        let fetchRequest = CNContactFetchRequest.init(keysToFetch: [CNContactVCardSerialization.descriptorForRequiredKeys()])
        
        do {
            try contactStore.enumerateContacts(with: fetchRequest) { (contact, end) in
                contacts.append(contact)
            }
        }
        catch {
            print("Failed to fetch")
        }
        
        return contacts
    }
    
}
