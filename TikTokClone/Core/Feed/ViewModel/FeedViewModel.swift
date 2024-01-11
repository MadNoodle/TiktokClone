//
//  FeedViewModel.swift
//  TikTokClone
//
//  Created by User on 11.1.2024.
//

import Foundation

class FeedViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var posts = [Post]()
    
    // MARK: - Init
    init() {
        self.fetchPosts()
    }
    
    // MARK: - Get Data methods
    func fetchPosts() {
        self.posts = [
            .init(id: NSUUID().uuidString, videoURL: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
            .init(id: NSUUID().uuidString, videoURL: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"),
            .init(id: NSUUID().uuidString, videoURL: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"),
            .init(id: NSUUID().uuidString, videoURL: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4"),
            .init(id: NSUUID().uuidString, videoURL: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"),
        ]
    }
}
