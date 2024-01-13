//
//  UserCellView.swift
//  TikTokClone
//
//  Created by User on 10.1.2024.
//

import SwiftUI

struct UserCell: View {
    let user: User
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 48, height: 48)
                .foregroundStyle(.gray)
            
            VStack(alignment: .leading) {
                Text(self.user.username)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(self.user.fullname)
                    .font(.footnote)
            }
            .foregroundStyle(.black)
            
            Spacer()
        }
    }
}

#Preview {
    UserCell(user: PreviewProvider.users[0])
}
