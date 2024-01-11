//
//  ProfileView.swift
//  TikTokClone
//
//  Created by User on 11.1.2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 2) {
                    // Profile Header
                    ProfileHeaderView()
                    
                    // Posts grid
                    PostsGridView()
                }
                .padding(.top)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
