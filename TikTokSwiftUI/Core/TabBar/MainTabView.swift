//
//  MainTabView.swift
//  TikTokSwiftUI
//
//  Created by HardiB.Salih on 6/2/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    @State private var showCreateThread = false
    @Namespace private var tabAnimation
    
    private let authService: AuthService
    init(authService: AuthService) {
        self.authService = authService
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                            .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                        
                        Text("Home")
                    }
                    
                }
                .onAppear { selectedTab = 0 }
                .tag(0)
            
            ExplorView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 1 ? "person.2.fill" : "person.2")
                            .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                        Text("Frends")
                    }
                }
                .onAppear { selectedTab = 1 }
                .tag(1)
            
            Text("Create Buddy")
                .tabItem {
                    Image("creations")
                }
                .onAppear { selectedTab = 2 }
                .tag(2)
            
            
            NotificationsView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                            .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                        Text("Inbox")
                    }
                }
                .onAppear { selectedTab = 3 }
                .tag(3)
            
            CurrentUserView(authService: authService)
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                            .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                        Text("Profile")
                    }
                }
                .onAppear { selectedTab = 4 }
                .tag(4)
            
        }
        .onChange(of: selectedTab, { oldValue, newValue in
            withAnimation(.smooth) {
                if newValue == 2 {
                    showCreateThread = true
                    selectedTab = 0
                }
            }
        })
        .sheet(isPresented: $showCreateThread) {
            //            CreateThreadView(isPresented: $showCreateThread)
            Text("Createion Page")
        }
        .tint(Color(.label))
    }
}

#Preview {
    MainTabView(authService: AuthService())
}

