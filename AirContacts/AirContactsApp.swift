//
//  AirContactsApp.swift
//  AirContacts
//
//  Created by Piotr Waś on 28/09/2022.
//

import SwiftUI
import Contacts

@main
struct AirContactsApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(MainViewModel())
        }
    }
}
