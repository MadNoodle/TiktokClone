//
//  UserService.swift
//  TikTokClone
//
//  Created by User on 12.1.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseSharedSwift

struct UserService: UserServiceProtocol {
    
    func uploadUserData(_ user: User) async throws {
        do {
            let userData = try Firestore.Encoder().encode(user)
            try await FirestoreConstants.UsersCollection.document(user.id).setData(userData)
        } catch {
            throw error
        }
    }
    
    func fetchUsers() async throws -> [User] {
        do {
            let snapshot = try await FirestoreConstants.UsersCollection.getDocuments()
            return snapshot.documents.compactMap { try? $0.data(as: User.self)}
        } catch {
            throw error
        }
    }
    
    func fetchCurrentUser() async throws -> User? {
        guard let currentId = Auth.auth().currentUser?.uid else { return nil }
        let currentUser = try await FirestoreConstants.UsersCollection.document(currentId).getDocument(as: User.self)
        return currentUser
        
    }
}
