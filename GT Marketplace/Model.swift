//
//  Model.swift
//  GT Marketplace
//
//  Created by Eric Zhou on 10/27/22.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class Model: ObservableObject {
  @Published var listings: [Listing] = []
      
          let ref = Database.database().reference()
      
      private let encoder = JSONEncoder()
      private let decoder = JSONDecoder()
      
      func listentoRealtimeDatabase() {
          ref
              .observe(.childAdded) { [weak self] snapshot in
                  guard
                      let self = self,
                      var json = snapshot.value as? [String: Any]
                  else {
                      return
                  }
                  json["id"] = snapshot.key
                  do {
                      let listingData = try JSONSerialization.data(withJSONObject: json)
                      let listing = try self.decoder.decode(Listing.self, from: listingData)
                      print(listing)
                      self.listings.append(listing)
                  } catch {
                      print("an error occurred", error)
                  }
              }
      }
  
      func stopListening() {
          ref.removeAllObservers()
      }
  

  
  func pushListing(title: String, price: Int) {
    var newListing = Listing()
    newListing.id = UUID()
    newListing.title = title
    newListing.price = price
    ref.child(newListing.id.uuidString).setValue(newListing.toDictionary)
  }
  
  func deleteListing(title: String) {
    
  }
}

