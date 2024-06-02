//
//  Post.swift
//  TikTokSwiftUI
//
//  Created by HardiB.Salih on 6/2/24.
//

import Foundation

struct Post: Identifiable, Codable {
    let id: String
    let videoUrlString: String
    
    var videoURL: URL? {
            URL(string: videoUrlString)
        }
}
