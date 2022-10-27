//
//  Listing.swift
//  GT Marketplace
//
//  Created by Max Yuan on 10/4/22.
//
import SwiftUI

struct Listing: Identifiable, Encodable {
    var id = UUID()
    var title: String = ""
    var date: String = ""
    var price: Int = 0
}

extension Encodable {
  var toDictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else {
      return nil
    }
    return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
  }
}

struct ListingCardView: View {
    var listing: Listing
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Item: \(listing.title)")
                
            Text("Listing date: \(listing.date)")
                
            Text("Listing price: $\(listing.price)")
        }
    }
}

struct Listing_Previews: PreviewProvider {
    static var previews: some View {
        ListingCardView(listing: Listing(title: "TV", date: "August 5, 2022", price: 500))
    }
}
