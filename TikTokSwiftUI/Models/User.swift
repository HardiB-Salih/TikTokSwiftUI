//
//  User.swift
//  TikTokSwiftUI
//
//  Created by HardiB.Salih on 6/3/24.
//

import SwiftUI
import Firebase

struct User: Identifiable, Codable, Hashable {
    let id : String
    let email: String
    let username: String
    let fullname: String
    var createAt: Timestamp = Timestamp()
    var bio: String?
    var profileImageUrl: String?
    var timestamp: Timestamp
}



extension String {
    static let id = "id"
    static let email = "email"
    static let username = "username"
    static let fullname = "fullname"
    static let bio = "bio"
    static let profileImageUrl = "profileImageUrl"
    static let createAt = "createAt"
    static let timestamp = "timestamp"

}


