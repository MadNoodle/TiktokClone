//
//  AuthenticationService.swift
//  TikTokClone
//
//  Created by User on 12.1.2024.
//

import Foundation
import FirebaseAuth

class AuthService: AuthServiceProtocol {

    @Published var userSession: String?
    
    var session: Published<String?>.Publisher {
        return self.$userSession
    }
    
    private let userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    
    func updateUserSession() {
        self.userSession = Auth.auth().currentUser?.uid
    }
    
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user.uid
        } catch {
            throw error
        }
    }
    
    func createUser(
        withEmail email: String,
        password: String,
        username: String,
        fullname: String
    ) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user.uid
            try await self.uploadUserData(
                withEmail: email,
                id: result.user.uid,
                username: username,
                fullname: fullname
            )
        } catch {
            throw error
        }
    }
    
    func logOut() {
        try? Auth.auth().signOut()
        self.userSession = nil

    }
}

private extension AuthService {
    func uploadUserData(
        withEmail email: String,
        id: String,
        username: String,
        fullname: String
    ) async throws {
        do {
            let user = User(id: id, username: username, email: email, fullname: fullname)
            try await self.userService.uploadUserData(user)
        } catch {
            throw error
        }
    }
}
