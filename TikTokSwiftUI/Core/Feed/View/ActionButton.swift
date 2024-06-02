//
//  ActionButton.swift
//  TikTokSwiftUI
//
//  Created by HardiB.Salih on 6/2/24.
//

import SwiftUI

struct ActionButton : View {
    let iconName : String
    let text: String?
    let width: CGFloat
    let height: CGFloat
    let action: () -> Void
    
    init(iconName: String, text: String? = nil , width: CGFloat = 28, height: CGFloat = 28, action: @escaping () -> Void) {
        self.iconName = iconName
        self.text = text
        self.width = width
        self.height = height
        self.action = action
    }
    
    
    var body: some View {
        Button(action: action , label: {
            if let text {
                VStack {
                    Image(systemName: iconName)
                        .resizable()
                        .frame(width: width, height: height)
                    
                    Text(text)
                        .font(.caption)
                        .fontWeight(.bold)
                    
                }
                .foregroundStyle(.white)
            } else {
                Image(systemName: iconName)
                    .resizable()
                    .frame(width: width, height: height)
                    .foregroundStyle(.white)
            }
        })
    }
}

#Preview {
    ActionButton(iconName: "calendar", action: { })
}
