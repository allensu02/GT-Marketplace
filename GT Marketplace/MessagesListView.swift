//
//  MessagesListView.swift
//  GT Marketplace
//
//  Created by Mark Lau on 11/15/22.
//

import SwiftUI

struct MessagesListView: View {
    let samples = ["Allen", "Mark", "Adi"]
    @State private var searchText = ""

    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(searchFound, id: \.self) { sample in NavigationLink(destination: Text(sample)) { MessageCellView(name: sample, message: "Temp Message")
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

struct MessagesListView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesListView()
    }
}
