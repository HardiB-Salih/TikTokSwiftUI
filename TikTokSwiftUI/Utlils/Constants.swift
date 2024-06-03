//
//  Constants.swift
//  TikTokSwiftUI
//
//  Created by HardiB.Salih on 6/3/24.
//

import Firebase

struct FirestoreCollections {
    private static let Root = Firestore.firestore()
    static let users = Root.collection("users")
    
    
    // Add other collections if needed
}
