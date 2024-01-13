//
//  TikTokCloneApp.swift
//  TikTokClone
//
//  Created by User on 9.1.2024.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct TikTokCloneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    private let container = DIContainer.live
    
    var body: some Scene {
        WindowGroup {
            RootView(
                authService: self.container.authService,
                userService: self.container.userService
            )
        }
    }
}
