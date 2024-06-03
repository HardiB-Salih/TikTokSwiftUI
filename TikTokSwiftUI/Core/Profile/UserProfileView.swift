//
//  UserProfileView.swift
//  TikTokSwiftUI
//
//  Created by HardiB.Salih on 6/3/24.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            VStack(spacing: 2) {
                // Header
                ProfileHeaderView(user: user)
                    .padding()
                
                Divider()
                
                // Post Grid View
                PostGridView()
            }
        }
        .scrollIndicators(.hidden)
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    UserProfileView(user: DeveloperPreview.user)
//}
