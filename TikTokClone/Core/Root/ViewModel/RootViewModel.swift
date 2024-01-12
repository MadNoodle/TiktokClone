//
//  RootViewModel.swift
//  TikTokClone
//
//  Created by User on 12.1.2024.
//

import Foundation
import FirebaseAuth
import Combine

@MainActor
class RootViewModel: ObservableObject {
    // MARK: - Properties
    @Published var userSession: FirebaseAuth.User?
    private let authService: AuthService
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Init
    init(authService: AuthService) {
        self.authService = authService
        self.setupSubscribers()
        self.authService.updateUserSession()
    }
    
}

private extension RootViewModel {
    func setupSubscribers() {
        self.authService.$userSession.sink { [weak self] user in
            self?.userSession = user
        }
        .store(in: &self.cancellables)
    }
}
