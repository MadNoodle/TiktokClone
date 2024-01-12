//
//  RegistrationViewModel.swift
//  TikTokClone
//
//  Created by User on 12.1.2024.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) {
        Task {
            do {
                try await self.authService.createUser(withEmail: email, password: password, username: username, fullname: fullname)
            } catch {
                print("DEBUG: Did fail with \(error.localizedDescription)")
            }
        }
    }
}
