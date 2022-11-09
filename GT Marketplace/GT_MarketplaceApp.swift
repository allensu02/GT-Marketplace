//
//  GT_MarketplaceApp.swift
//  GT Marketplace
//
//  Created by Allen Su on 9/27/22.
//

import SwiftUI
import Firebase

@main
struct GT_MarketplaceApp: App {
    init() {
      FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
          ImageView()
        }
    }
}
