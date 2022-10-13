//
//  FeedListView.swift
//  GT Marketplace
//
//  Created by Dubem Nwizubo on 9/29/22.
//

import SwiftUI

struct FeedListView: View {
    var body: some View {
        NavigationView {
            List(0..<20) { item in
                HStack {
                    Image("couch1")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(4)
                
                    VStack(alignment: .leading, spacing: 25) {
                        Text("Orange Couch")
                            .bold()
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        Text("I think this is a couch, not sure though.")
                            .lineLimit(3)
                            .minimumScaleFactor(0.5)
                    }
                }
            }
            .navigationTitle("Feed")
        }
    }
}

struct FeedListView_Previews: PreviewProvider {
    static var previews: some View {
        FeedListView()
    }
}
