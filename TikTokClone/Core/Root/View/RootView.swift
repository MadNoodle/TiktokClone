//
//  RootView.swift
//  TikTokClone
//
//  Created by User on 12.1.2024.
//

import SwiftUI

struct RootView: View {
    @StateObject private var viewModel: RootViewModel
    private let authService: AuthServiceProtocol
    private let userService: UserServiceProtocol
    
    init(
        authService: AuthServiceProtocol,
        userService: UserServiceProtocol
    ) {
        self.authService = authService
        self.userService = userService
        self._viewModel = StateObject(
            wrappedValue: .init(
                authService: authService,
                userService: userService
            )
        )
    }
    
    var body: some View {
        Group {
            if self.viewModel.userSession != nil {
                if let currentUser = self.viewModel.currentUser {
                    MainTabView(
                        authService: self.authService,
                        userService: self.userService,
                        currentUser: currentUser
                    )
                }
            } else {
                LoginView(authService: self.authService)
            }
        }
    }
}

#Preview {
    RootView(
        authService: DIContainer.mock.authService,
        userService: DIContainer.mock.userService
    )
}
