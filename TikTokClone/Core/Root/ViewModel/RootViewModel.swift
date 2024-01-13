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
    @Published var userSession: String?
    @Published var currentUser: User?
    
    private let authService: AuthServiceProtocol
    private let userService: UserServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Init
    init(
        authService: AuthServiceProtocol,
        userService: UserServiceProtocol
    ) {
        self.authService = authService
        self.userService = userService
        self.setupSubscribers()
        self.authService.updateUserSession()
    }
}

private extension RootViewModel {
    @MainActor
    func setupSubscribers() {
            self.authService.session.sink { [weak self] user in
                DispatchQueue.main.async {
                    self?.userSession = user
                    self?.fetchCurrentUser()
                }
            }
            .store(in: &self.cancellables)
    }
    
    @MainActor
    func fetchCurrentUser() {
        guard userSession != nil else { return }
        Task {
            do {
                self.currentUser = try await self.userService.fetchCurrentUser()
            } catch {
                throw error
            }
        }
    }
}
