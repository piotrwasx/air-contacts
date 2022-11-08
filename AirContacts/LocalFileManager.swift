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
    
    let fileURL = FileManager
        .default
        .urls(for: .documentDirectory, in: .userDomainMask)
        .first!
        .appendingPathComponent("/AirContacts.vcf")
    
    func saveContactsInFile(contacts : [CNContact]) {
        let data: NSData?
        do {
            try data = CNContactVCardSerialization.data(with: contacts) as NSData
            do {
                try data?.write(to: fileURL, options: .atomic)
            }
            catch {
                print("Failed to write!")
            }
        }
        catch {
            print("Failed!")
        }
    }
    
    func fileExists(path: String) -> Bool {
        if FileManager.default.fileExists(atPath: path) {
            return true
        }
        else {
            return false
        }
    }
    
    func fileModificationDate(path: String) -> Date? {
        do {
            let attr = try FileManager.default.attributesOfItem(atPath: path)
            return attr[FileAttributeKey.modificationDate] as? Date
        }
        catch {
            return nil
        }
    }
    
}
