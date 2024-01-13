//
//  User.swift
//  TikTokClone
//
//  Created by User on 12.1.2024.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let username: String
    let email: String
    let fullname: String
    var bio: String?
    var profileImage: String?
}
