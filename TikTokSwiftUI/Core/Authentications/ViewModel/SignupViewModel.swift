//
//  SignupViewModel.swift
//  TikTokSwiftUI
//
//  Created by HardiB.Salih on 6/2/24.
//

import SwiftUI


class SignupViewModel: ObservableObject {
    private let authService: AuthService
    
    init (authService: AuthService){
        self.authService = authService
    }
    
    
    func createUser(withEmail email: String,
                    fullname: String,
                    username: String,
                    password: String) async {
        do {
            try await authService.createUser(withEmail: email, fullname: fullname, username: username, password: password)
        } catch {
            print(error.localizedDescription)
        }
    }
}
