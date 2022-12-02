//
//  MessagesSearchBar.swift
//  GT Marketplace
//
//  Created by Steve Tang on 11/29/22.
//

import SwiftUI

struct MessagesSearchBar: View {
    let samples = ["Allen", "Mark", "Adi"]
    @State private var searchText = ""
    
    struct Users {
        var name = String()
        var description = String()
    }
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(searchFound, id: \.self) { sample in NavigationLink(destination: Text(sample)) { Text(sample)
                        
                        }
                        
                    }
                }
                .searchable(text: $searchText)
                .navigationTitle("Messages")
            }
        }
    }
    var searchFound: [String] {
        if searchText.isEmpty {
            return samples
        } else {
            return samples.filter { $0.contains(searchText) }
        }
    }
}

struct MessagesSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        MessagesSearchBar()
    }
}
