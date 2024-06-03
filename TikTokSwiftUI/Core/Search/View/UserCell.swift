//
//  UserCell.swift
//  TikTokSwiftUI
//
//  Created by HardiB.Salih on 6/2/24.
//

import SwiftUI

struct UserCell: View {
    let user: User
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 48, height: 48)
                .foregroundStyle(Color(.systemGray5))
            
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(user.fullname)
                    .font(.footnote)
            }
            .foregroundStyle(Color(.label))
            
            Spacer()
        }
        
    }
}

//#Preview {
//    UserCell(user: DeveloperPreview.user)
//}
