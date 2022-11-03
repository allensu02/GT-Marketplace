//
//  Model.swift
//  GT Marketplace
//
//  Created by Eric Zhou on 10/27/22.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

final class Model: ObservableObject {
    @Published var listings: [Listing] = []
    
    private let ref = Database.database().reference()
    
    private lazy var databasePath: DatabaseReference? = {
        let ref = Database.database().reference().child("Listings")
        return ref
    }()
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    func listentoRealtimeDatabase() {
        guard let databasePath = databasePath else {
            return
        }
        databasePath
            .observe(.childAdded) { [weak self] snapshot in
                guard
                    let self = self,
                    var json = snapshot.value as? [String: Any]
                else {
                    return
                }
                json["id"] = snapshot.key
                do {
                    let ListingData = try JSONSerialization.data(withJSONObject: json)
                    let listing = try self.decoder.decode(Listing.self, from: ListingData)
                    self.listings.append(listing)
                } catch {
                    print("an error occurred", error)
                }
            }
    }
    
    func pushListing(title: String, price: Int) {
      var newListing = Listing()
      newListing.id = UUID()
      newListing.title = title
      newListing.price = price
      ref.child("Listings/" + newListing.id.uuidString).setValue(newListing.toDictionary)
    }
    
    func deleteListing(id: String) {
        ref.child("Listings/" + id).removeValue()
    }
    
    func stopListening() {
        databasePath?.removeAllObservers()
    }
}
