//
//  ExplorView.swift
//  TikTokSwiftUI
//
//  Created by HardiB.Salih on 6/2/24.
//

import SwiftUI

struct ExplorView: View {
    @State private var explorViewModel = ExplorViewModel(userService: UserService())
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack (spacing: 16){
                    ForEach(explorViewModel.users) { userObject in
                        NavigationLink(value: userObject) {
                            UserCell(user: userObject)
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                UserProfileView(user: user)
            })
            .scrollIndicators(.hidden)
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top)
        }
    }
}

//#Preview {
//    ExplorView()
//}
