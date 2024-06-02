//
//  FeedViewModel.swift
//  TikTokSwiftUI
//
//  Created by HardiB.Salih on 6/2/24.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts : [Post] = []

    init() {
        fetchposts()
    }
    
    private let videoUrl = [
        "https://videos.pexels.com/video-files/6872480/6872480-hd_1080_1920_25fps.mp4",
        "https://videos.pexels.com/video-files/5638449/5638449-sd_540_960_25fps.mp4",
        "https://videos.pexels.com/video-files/4761433/4761433-hd_720_1366_25fps.mp4",
        "https://videos.pexels.com/video-files/6012517/6012517-sd_540_960_25fps.mp4",
        "https://videos.pexels.com/video-files/8064146/8064146-sd_540_674_30fps.mp4",
        "https://videos.pexels.com/video-files/5752365/5752365-sd_540_960_25fps.mp4",
        "https://videos.pexels.com/video-files/5320011/5320011-sd_540_960_25fps.mp4",
        "https://videos.pexels.com/video-files/6955621/6955621-sd_540_960_25fps.mp4",
        "https://videos.pexels.com/video-files/4536081/4536081-sd_540_960_25fps.mp4",
        "https://videos.pexels.com/video-files/6390164/6390164-sd_540_960_25fps.mp4",
        "https://videos.pexels.com/video-files/6019741/6019741-sd_540_960_25fps.mp4",
        "https://videos.pexels.com/video-files/5752378/5752378-sd_540_960_25fps.mp4"
    ]
    
    func fetchposts() {
        posts = videoUrl.map { Post(id: UUID().uuidString, videoUrlString: $0) }
    }
    

}





