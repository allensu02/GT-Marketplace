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
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
      FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            LoginView()
                .environmentObject(viewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        return true
    }
}
