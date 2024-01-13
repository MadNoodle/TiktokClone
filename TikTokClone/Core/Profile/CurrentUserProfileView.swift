//
//  ProfileView.swift
//  TikTokClone
//
//  Created by User on 11.1.2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    private let authService: AuthServiceProtocol
    private let currentUser: User
    
    init(
        authService: AuthServiceProtocol,
        user: User
    ) {
        self.authService = authService
        self.currentUser = user
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 2) {
                    // Profile Header
                    ProfileHeaderView(user: self.currentUser)
                    
                    // Posts grid
                    PostsGridView()
                }
                .padding(.top)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(id: "id", placement: .topBarTrailing) {
                    Button(action: {
                        self.authService.logOut()
                    }, label: {
                        Text("Sign out")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    })
                }
            }
        }
    }
}


