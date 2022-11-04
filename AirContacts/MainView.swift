//
//  MainView.swift
//  AirContacts
//
//  Created by Piotr Waś on 28/09/2022.
//

import SwiftUI
import Contacts

struct MainView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    
    @State var wasButtonClicked = false
    
    var body: some View {
        VStack {
            Button("Fetch Contacts") {
                wasButtonClicked = true
                
                DispatchQueue.global(qos: .userInitiated).async {
                    viewModel.manager.saveContactsInDocument(contacts: viewModel.fetchAllContacts())
                }
            }
            
            Spacer()
                .frame(height: 40)
            
            if wasButtonClicked {
                Text("File created!")
                    .foregroundColor(Color(.green))
                
                ShareLink(item: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("/AirContacts.vcf"))
            }
        }
        .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
