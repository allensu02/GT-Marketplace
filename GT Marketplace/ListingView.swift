//
//  SwiftUIView.swift
//  GT Marketplace
//
//  Created by Max Yuan on 10/4/22.
//

import SwiftUI

struct ListingView: View {
    
    let listings = [
        Listing(name: "TV", date: "August 5, 2022", price: 500),
        Listing(name: "Couch", date: "August 5, 2022", price: 100),
        Listing(name: "Lamp", date: "August 5, 2022", price: 20),
    ]
    
    
    var body: some View {
        NavigationView {
            List(listings) {
                Listing in NavigationLink(destination: SwiftUIView()) {
                    listingView(listing: Listing)
                }
                    
            }
            .navigationBarTitle("Listings", displayMode: .large)
        }
    }
}

struct ListingView_Previews: PreviewProvider {
    static var previews: some View {
        ListingView()
    }
}
