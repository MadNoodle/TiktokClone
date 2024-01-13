//
//  UserServiceProtocol.swift
//  TikTokClone
//
//  Created by User on 13.1.2024.
//

import Foundation

protocol UserServiceProtocol {
    func uploadUserData(_ user: User) async throws
    
    func fetchUsers() async throws -> [User]
    
    func fetchCurrentUser() async throws -> User?
}
