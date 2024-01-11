//
//  PostsGridView.swift
//  TikTokClone
//
//  Created by User on 11.1.2024.
//

import SwiftUI

struct PostsGridView: View {
    
    private let width = (UIScreen.main.bounds.width / 3) - 2
    
    private let items = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        LazyVGrid(columns: self.items, spacing: 2) {
            ForEach(0..<25) { post in
                    Rectangle()
                    .frame(width: self.width, height: 150)
                    .clipped()
            }
        }
    }
}

#Preview {
    PostsGridView()
}
