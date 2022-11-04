//
//  LocalFileManager.swift
//  AirContacts
//
//  Created by Piotr Waś on 04/11/2022.
//

import SwiftUI
import Contacts

class LocalFileManager {
    
    static let instance = LocalFileManager()
    
    func saveContactsInDocument(contacts : [CNContact]) {
        
        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentPath.appendingPathComponent("/AirContacts.vcf")
        
        let data : NSData?
        do {
            try data = CNContactVCardSerialization.data(with: contacts) as NSData
            do {
                try data?.write(to: fileURL, options: .atomic)
                print(fileURL.absoluteString)
            }
            catch {
                print("Failed to write!")
            }
        }
        catch {
            print("Failed!")
        }
    }
    
}
