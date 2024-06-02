//
//  CurrentUserView.swift
//  TikTokSwiftUI
//
//  Created by HardiB.Salih on 6/2/24.
//

import SwiftUI

struct CurrentUserView: View {
    let authService : AuthService
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 2) {
                    // Header
                    ProfileHeaderView()
                        .padding()
                    
                    Divider()
                    
                    // Post Grid View
                    PostGridView()
                        
                }
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Log out", action: {
                        authService.signOut()
                    })
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.label))
                }
            }
        }
    }
}

#Preview {
    CurrentUserView(authService: AuthService())
}
