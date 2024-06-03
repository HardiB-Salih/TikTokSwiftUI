//
//  ContentView.swift
//  TikTokSwiftUI
//
//  Created by HardiB.Salih on 6/2/24.
//

import SwiftUI

struct ContentView: View {
    private let authService: AuthService
    private let userService: UserService
    @StateObject private var contentVM : ContentViewModel
    
    init(authService: AuthService, userService: UserService) {
        self.authService = authService
        self.userService = userService
        
        self._contentVM = StateObject(wrappedValue: ContentViewModel(authService: authService, userService: userService))
    }
    
    var body: some View {
        Group {
            if contentVM.userSession != nil {
                if let currentUser = contentVM.currentUser {
                    MainTabView(authService: authService, 
                                currentUser: currentUser)

                }
            } else {
                LoginView(authService: authService)
            }
        }
    }
}

//#Preview {
//    ContentView(authService: AuthService())
//}
