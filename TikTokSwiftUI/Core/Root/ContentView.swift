//
//  ContentView.swift
//  TikTokSwiftUI
//
//  Created by HardiB.Salih on 6/2/24.
//

import SwiftUI

struct ContentView: View {
    private let authService: AuthService
    @StateObject private var contentVM : ContentViewModel
    
    init(authService: AuthService) {
        self.authService = authService
        self._contentVM = StateObject(wrappedValue: ContentViewModel(authService: authService))
    }
    
    var body: some View {
        Group {
            if contentVM.userSession != nil {
                MainTabView(authService: authService)
            } else {
                LoginView(authService: authService)
            }
        }
    }
}

#Preview {
    ContentView(authService: AuthService())
}
