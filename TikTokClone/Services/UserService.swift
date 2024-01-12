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

struct UserService {
    func uploadUserData(_ user: User) async throws {
        do {
            let userData = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(userData)
        } catch {
            throw error
        }
    }
}
