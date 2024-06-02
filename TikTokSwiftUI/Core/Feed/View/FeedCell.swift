//
//  FeedCell.swift
//  TikTokSwiftUI
//
//  Created by HardiB.Salih on 6/2/24.
//

import SwiftUI
import AVKit

struct FeedCell: View {
    let post: Post
    let player: AVPlayer
    
    init(post: Post, player: AVPlayer) {
        self.post = post
        self.player = player
    }
    
    var body: some View {
        ZStack (alignment: .bottom) {
            CustomVideoPlayer(player: player)
                .containerRelativeFrame([.horizontal, .vertical])
            
            HStack (alignment: .bottom){
                VStack (alignment: .leading){
                    Text("HardiB.Salih")
                        .fontWeight(.semibold)
                    Text("Rockets prepare for take off 🚀🚀🚀")
                }
                .font(.subheadline)
                .foregroundStyle(.white)
                
                Spacer()
                // Buttons Gos Here
                
                VStack (spacing: 28){
                    
                    Circle()
                        .fill(.gray)
                        .frame(width: 48, height: 48)
                    
                    ActionButton(iconName: "suit.heart.fill", text: "47") {  }
                    ActionButton(iconName: "ellipsis.bubble.fill", text: "47") {  }
                    ActionButton(iconName: "bookmark.fill", width: 22) {  }
                    ActionButton(iconName: "arrowshape.turn.up.right.fill", width: 22) {  }
                }
                
            }
            .padding()
            .padding(.bottom, 80)
            
        }
        .onTapGesture {
            switch player.timeControlStatus {
            case .paused:
                player.play()
            case .waitingToPlayAtSpecifiedRate:
                break
            case .playing:
                player.pause()
            @unknown default:
                break
            }
        }
        
    }
}

#Preview {
    FeedCell(post: Post(id: UUID().uuidString, videoUrlString: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"), player: AVPlayer())
}



