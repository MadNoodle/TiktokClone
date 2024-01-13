//
//  ProfileHeaderView.swift
//  TikTokClone
//
//  Created by User on 11.1.2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    var body: some View {
        VStack(spacing: 16) {
            // Profile Image
            VStack(spacing: 8) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color(.systemGray5))
                
                Text("\(self.user.username)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            
            // Stats view
            HStack(spacing: 16) {
                UserStatView(value: 5, title: "Following")
                
                UserStatView(value: 1, title: "Followers")
                
                UserStatView(value: 7, title: "Likes")
            }
            
            Button(action: {}, label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundStyle(.black)
                    .background(Color(.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            })
            
            Divider()
        }
    }
}

#Preview {
    ProfileHeaderView(user: PreviewProvider.users[0])
}
