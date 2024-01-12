//
//  LoginViewModel.swift
//  TikTokClone
//
//  Created by User on 12.1.2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    @MainActor
    func login(withEmail email: String, password: String) {
        Task {
            do {
                try await self.authService.login(withEmail: email, password: password)
            } catch {
                print("DEBUG: Did fail with \(error.localizedDescription)")
            }
        }
    }
}
