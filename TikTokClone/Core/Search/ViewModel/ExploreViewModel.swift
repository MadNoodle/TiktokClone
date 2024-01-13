//
//  ExploreViewModel.swift
//  TikTokClone
//
//  Created by User on 13.1.2024.
//

import Foundation

@MainActor
class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var errorMessage: String?
    
    private let service: UserServiceProtocol
    
    init(service: UserServiceProtocol) {
        self.service = service
        self.fetchUsers()
    }
    
    private func fetchUsers() {
        Task {
            do {
                self.users = try await self.service.fetchUsers()
            } catch {
                self.errorMessage = error.localizedDescription
                print("DEBUG: Error while fetching users of type: \(error.localizedDescription)")
            }
        }
    }
}
