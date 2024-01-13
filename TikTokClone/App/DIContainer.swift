//
//  DIContainer.swift
//  TikTokClone
//
//  Created by User on 13.1.2024.
//

import Foundation

enum DIContainer {
    case live
    case mock
    
    var userService: UserServiceProtocol {
        switch self {
        case .live:
            return UserService()
        case .mock:
            return MockUserService()
        }
    }
    
    var authService: AuthServiceProtocol {
        switch self {
        case .live:
            return AuthService(userService: self.userService)
        case .mock:
            return MockAuthService()
        }
    }
    
    
}
