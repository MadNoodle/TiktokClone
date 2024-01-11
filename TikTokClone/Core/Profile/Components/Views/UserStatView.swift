//
//  UserStatView.swift
//  TikTokClone
//
//  Created by User on 11.1.2024.
//

import SwiftUI

struct UserStatView: View {
    
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(self.value)")
                .font(.subheadline)
                .fontWeight(.bold)
            
            Text(self.title)
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .frame(width: 80, alignment: .center)
    }
}
