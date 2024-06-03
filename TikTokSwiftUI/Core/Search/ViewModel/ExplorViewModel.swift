//
//  ExplorViewModel.swift
//  TikTokSwiftUI
//
//  Created by HardiB.Salih on 6/3/24.
//

import Foundation

class ExplorViewModel: ObservableObject {
    @Published var users : [User] = []
    private let userService: UserService
    
    init(userService: UserService) {
        self.userService = userService
        Task { await fetchUsers() }
    }
    
    
    @MainActor
    private func fetchUsers() async {
        do {
            self.users = try await userService.fetchUsers()
        } catch {
            print("💿 Error Fetching Users: \(error.localizedDescription)")
        }
    }
}
