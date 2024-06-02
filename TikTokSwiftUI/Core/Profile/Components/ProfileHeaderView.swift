//
//  ProfileHeaderView.swift
//  TikTokSwiftUI
//
//  Created by HardiB.Salih on 6/2/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack (spacing: 16){
            VStack(spacing: 8) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundStyle(Color(.systemGray5))
                
                Text("@hardiB.sal")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            HStack(spacing: 16) {
                UserStatView(value: 5, title: "Following")
                UserStatView(value: 1, title: "Followers")
                UserStatView(value: 3, title: "Likes")
            }
            
            Button(action: {}, 
                   label: {
                Text("Edit Profile")
                    .foregroundStyle(Color(.label))
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    
            })
        }
    }
}

#Preview {
    ProfileHeaderView()
}


