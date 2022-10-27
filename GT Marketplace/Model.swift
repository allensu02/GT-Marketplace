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
  private let ref = Database.database().reference()

  
  func pushListing(title: String, price: Int) {
    var newListing = Listing()
    newListing.id = UUID()
    newListing.title = title
    newListing.price = price
    ref.child(newListing.id.uuidString).setValue(newListing.toDictionary)
  }
}

