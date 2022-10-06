//
//  Listing.swift
//  GT Marketplace
//
//  Created by Max Yuan on 10/4/22.
//

import SwiftUI

struct Listing: Identifiable, Codable {
    var id = UUID()
    var name: String
    var date: String
    var price: Int
}

struct listingView: View {
    var listing: Listing
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Item: \(listing.name)")
                
            Text("Listing date: \(listing.date)")
                
            Text("Listing price: $\(listing.price)")
        }
    }
}

struct Listing_Previews: PreviewProvider {
    static var previews: some View {
        listingView(listing: Listing(name: "TV", date: "August 5, 2022", price: 500))
    }
}
