//
//  UserProfileView.swift
//  TikTokClone
//
//  Created by User on 13.1.2024.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            VStack(spacing: 2) {
                // Profile Header
                ProfileHeaderView(user: self.user)
                
                // Posts grid
                PostsGridView()
            }
            .padding(.top)
        }
        .navigationTitle("\(self.user.username)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    UserProfileView(user: PreviewProvider.users[0])
}
