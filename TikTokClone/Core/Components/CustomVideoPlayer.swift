//
//  CustomVideoPlayer.swift
//  TikTokClone
//
//  Created by User on 11.1.2024.
//

import SwiftUI
import AVKit

/// Custom instance of an `AVPlayerViewController` to be integrated in swiftUI
/// it allows us to have more control and display fullscreen videos
struct CustomVideoPlayer: UIViewControllerRepresentable {
    var player: AVPlayer
        
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = AVPlayerViewController()
        controller.player = self.player
        controller.showsPlaybackControls = false
        controller.exitsFullScreenWhenPlaybackEnds = true
        controller.allowsPictureInPicturePlayback = true
        controller.videoGravity = .resizeAspectFill
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
}
