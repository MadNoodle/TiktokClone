//
//  RootView.swift
//  TikTokClone
//
//  Created by User on 12.1.2024.
//

import SwiftUI

struct RootView: View {
    @StateObject private var viewModel: RootViewModel
    private let authService: AuthService
    
    init(injectedAuthService: AuthService) {
        self.authService = injectedAuthService
        self._viewModel = StateObject(wrappedValue: .init(authService: injectedAuthService))
    }
    
    var body: some View {
        Group {
            if self.viewModel.userSession != nil {
                MainTabView(authService: self.authService)
            } else {
                LoginView(authService: self.authService)
            }
        }
        
    }
}

#Preview {
    RootView(injectedAuthService: AuthService(userService: UserService()))
}
