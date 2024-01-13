//
//  AuthServiceProtocol.swift
//  TikTokClone
//
//  Created by User on 13.1.2024.
//

import Foundation
import FirebaseAuth

protocol AuthServiceProtocol {
    var userSession: String? { get }
    var session: Published<String?>.Publisher { get }
    
    func updateUserSession()
    
    func login(withEmail email: String, password: String) async throws
    
    func createUser(
        withEmail email: String,
        password: String,
        username: String,
        fullname: String
    ) async throws
    
    func logOut()
}
