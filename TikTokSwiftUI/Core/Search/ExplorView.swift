//
//  ExplorView.swift
//  TikTokSwiftUI
//
//  Created by HardiB.Salih on 6/2/24.
//

import SwiftUI

struct ExplorView: View {
    var body: some View {
        NavigationStack {
            ScrollView (showsIndicators: false){
                LazyVStack (spacing: 16){
                    ForEach(0 ..< 12) { userObject in
                        UserCell()
                            .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top)
        }
    }
}

#Preview {
    ExplorView()
}
