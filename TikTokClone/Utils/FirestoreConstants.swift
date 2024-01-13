//
//  FirestoreConstants.swift
//  TikTokClone
//
//  Created by User on 13.1.2024.
//

import Foundation
import FirebaseFirestore

enum FirestoreConstants {
    static let Root = Firestore.firestore()
    static let UsersCollection = Root.collection("users")
}
