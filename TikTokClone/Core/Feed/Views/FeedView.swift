//
//  FeedView.swift
//  TikTokClone
//
//  Created by User on 10.1.2024.
//

import SwiftUI
import AVKit

struct FeedView: View {
    // MARK: - Properties
    @StateObject private var viewModel = FeedViewModel()
    @State var scrollPosition: String?
    @State private var player = AVPlayer()
    
    // MARK: - UI
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(self.viewModel.posts) { post in
                    FeedCell(post: post, player: self.player)
                        .id(post.id)
                        .onAppear {
                            self.playInitialVideoIfNecessary()
                        }
                }
            }
            .scrollTargetLayout()
        }
        .onAppear {
            self.player.play()
        }
        .scrollPosition(id: self.$scrollPosition)
        .scrollTargetBehavior(.paging)
        .onChange(of: self.scrollPosition) { oldValue, newValue in
            self.playVideoOnChangeOfScrollPosition(postId: newValue)
        }
        .ignoresSafeArea()
    }
    
    // MARK: - Player Controls
    func playVideoOnChangeOfScrollPosition(postId: String?) {
        guard
            let currentPost = self.viewModel.posts.first(where: { $0.id == postId}),
            let url =  URL(string: currentPost.videoURL)
        else { return }
        
        self.player.replaceCurrentItem(with: nil)
        let playerItem = AVPlayerItem(url: url)
        self.player.replaceCurrentItem(with: playerItem)
    }
    
    func playInitialVideoIfNecessary() {
        guard self.scrollPosition == nil,
              let post = self.viewModel.posts.first,
              self.player.currentItem == nil,
              let url = URL(string: post.videoURL)
        else { return }
        let item = AVPlayerItem(url: url)
        self.player.replaceCurrentItem(with: item)
    }
}

#Preview {
    FeedView()
}
