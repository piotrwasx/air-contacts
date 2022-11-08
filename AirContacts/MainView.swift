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
    @State var shouldShowShareButton = false
    @State var fileCreationDate: Date?
    
    var body: some View {
        VStack {
            Button("Fetch Contacts") {
                DispatchQueue.global(qos: .userInitiated).async {
                    viewModel.manager.saveContactsInFile(contacts: viewModel.fetchContacts())
                    fileCreationDate = viewModel.manager.fileModificationDate(path: viewModel.manager.fileURL.path)
                }
                wasButtonClicked = true
                shouldShowShareButton = true
            }
            
            Spacer()
                .frame(height: 40)
            
            if wasButtonClicked {
                Text("File created!")
                    .foregroundColor(Color(.green))
            }
            
            if shouldShowShareButton {
                ShareLink(item: viewModel.manager.fileURL)
                
                if fileCreationDate != nil {
                    Text(fileCreationDate!.formatted())
                }
            }
            
        }
        .padding()
        .onAppear() {
            if viewModel.manager.fileExists(path: viewModel.manager.fileURL.path) {
                shouldShowShareButton = true
                fileCreationDate = viewModel.manager.fileModificationDate(path: viewModel.manager.fileURL.path)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
