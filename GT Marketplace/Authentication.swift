//
//  Authentication.swift
//  GT Marketplace
//
//  Created by Rishi Aniga on 11/8/22.
//

import Foundation
import FirebaseCore
import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [
                     UIApplication.LaunchOptionsKey: Any
                   ]?) -> Bool {
    FirebaseApp.configure()
    ApplicationDelegate.shared.application(application,
                                           didFinishLaunchingWithOptions: launchOptions)

    return true
}
