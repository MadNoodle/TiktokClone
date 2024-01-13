//
//  MockAuthService.swift
//  TikTokClone
//
//  Created by User on 13.1.2024.
//

import Foundation
import FirebaseAuth

class MockAuthService: AuthServiceProtocol {
    
    @Published var userSession: String?
    
    var session: Published<String?>.Publisher {
        return self.$userSession
    }
    
    func updateUserSession() {
//        self.userSession = "mock"
    }
    
    func login(withEmail email: String, password: String) async throws {
        
    }
    
    func createUser(withEmail email: String, password: String, username: String, fullname: String) async throws {
        
    }
    
    func logOut() {
        
    }
}
