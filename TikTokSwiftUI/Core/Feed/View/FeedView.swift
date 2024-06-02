//
//  FeedView.swift
//  TikTokSwiftUI
//
//  Created by HardiB.Salih on 6/2/24.
//

import SwiftUI
import AVKit

struct FeedView: View {
    @StateObject private var viewModel = FeedViewModel()
    @State private var scrollPosition: String?
    @State private var player = AVPlayer()
    
    var body: some View {
        ScrollView {
            LazyVStack (spacing : 0) {
                ForEach(viewModel.posts) { post in
                    FeedCell(post: post, player: player)
                        .id(post.id)
                        .onAppear { playInitialVideoIfNecicery() }
                }
            }
            .scrollTargetLayout()
        }
        .onAppear {
            player.play()
        }
        .scrollPosition(id: $scrollPosition)
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
        .onChange(of: scrollPosition) { oldValue, newValue in
            playVideoOnChangeOfScrollPosition(postId: newValue ?? "")
        }
    }
    
    func playInitialVideoIfNecicery() {
        print("Its Initial Video Not showing")

        guard
            scrollPosition == nil,
            let post = viewModel.posts.first,
            player.currentItem == nil else { return }
        
        print("Its Initial Video")
        player.replaceCurrentItem(with: AVPlayerItem(url: post.videoURL!))
                
    }
    
    func playVideoOnChangeOfScrollPosition(postId: String) {
        guard let currentPost = viewModel.posts.first(where: {$0.id == postId }) else { return }

        player.replaceCurrentItem(with: nil)
        let playerItem = AVPlayerItem(url: currentPost.videoURL!)
        player.replaceCurrentItem(with: playerItem)
    }
}

#Preview {
    FeedView()
}
