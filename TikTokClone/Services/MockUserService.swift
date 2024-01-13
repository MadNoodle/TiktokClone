//
//  MockUserService.swift
//  TikTokClone
//
//  Created by User on 13.1.2024.
//

import Foundation

class MockUserService: UserServiceProtocol {
    func uploadUserData(_ user: User) async throws { }
    
    func fetchUsers() async throws -> [User] {
        return PreviewProvider.users
    }
    
    func fetchCurrentUser() async throws -> User? {
        return .init(id: NSUUID().uuidString, username: "test user", email: "user@gmil.com", fullname: "bob l eponge")
    }
}
