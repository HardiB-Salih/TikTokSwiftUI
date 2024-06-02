//
//  LoginViewModel.swift
//  TikTokSwiftUI
//
//  Created by HardiB.Salih on 6/2/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    private let authService: AuthService
    
    init (authService: AuthService){
        self.authService = authService
    }
    
    
    func login(withEmail email: String, password: String) async {
        do {
            try await authService.login(withEmail: email, password: password)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
