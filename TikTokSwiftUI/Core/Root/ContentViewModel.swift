//
//  ContentViewModel.swift
//  TikTokSwiftUI
//
//  Created by HardiB.Salih on 6/2/24.
//

import Firebase
import Combine

@MainActor
class ContentViewModel : ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private let authService: AuthService
    private var cancellables = Set<AnyCancellable>()

    init(authService: AuthService) {
        self.authService = authService

        // Start listening for user session changes immediately
        setupSubscribers()

        // Initiate an update to the user session.
        // This should trigger authentication logic in your AuthService.
        authService.updateUserSession()
    }

    private func setupSubscribers() {
        // Subscribe to changes in the authService's userSession
        authService.$userSession.sink { [weak self] user in
            self?.userSession = user // Update the view model's userSession
        }
        .store(in: &cancellables)
    }

    // Deinit to cancel subscriptions and prevent memory leaks
    deinit {
        cancellables.forEach { $0.cancel() }
    }
}
