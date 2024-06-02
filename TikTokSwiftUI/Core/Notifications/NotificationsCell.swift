//
//  NotificationsCell.swift
//  TikTokSwiftUI
//
//  Created by HardiB.Salih on 6/2/24.
//

import SwiftUI

struct NotificationsCell: View {
    var body: some View {
        HStack{
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundStyle(Color(.systemGray5))
            
            HStack {
                Text("hardiB.salih")
                    .font(.footnote)
                    .fontWeight(.semibold) +
                Text(" liked one of your posts")
                    .font(.footnote) +
                Text("  3d")
                    .font(.caption)
            }
            
            Spacer()
            
            Rectangle()
                .fill(.pink)
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationsCell()
}
