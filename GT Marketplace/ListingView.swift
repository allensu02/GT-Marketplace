//
//  SwiftUIView.swift
//  GT Marketplace
//
//  Created by Max Yuan on 10/4/22.
//
import SwiftUI

struct ListingView: View {
    
    let listings = [
        Listing(title: "TV", date: "August 5, 2022", price: 500),
        Listing(title: "Couch", date: "August 5, 2022", price: 100),
        Listing(title: "Lamp", date: "August 5, 2022", price: 20),
    ]
  
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
      return true
  }

  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if (editingStyle == .delete) {
          // removeListing function
      }
  }
    
    
    var body: some View {
        NavigationView {
            List(listings) {
                Listing in NavigationLink(destination: SwiftUIView()) {
                    ListingCardView(listing: Listing)
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
