//
//  AuthService.swift
//  TikTokSwiftUI
//
//  Created by HardiB.Salih on 6/2/24.
//

import Firebase

class AuthService {
    
    func login(withEmail email: String,
               password: String) async throws {
        
        print("DEBUG: LOGIN WITH \(email)  && \(password)")
        
    }
    
    func createUser(withEmail email: String,
                    fullname: String,
                    username: String,
                    password: String) async throws {
        print("DEBUG: Create User WITH \(email)  && Staff")
        
    }
    
    func resetPassword(withEmail email: String, password: String) async throws { }
    
    func changePassword(oldPassword: String, newPassword: String) async throws { }

    func signOut() {
        
    }
    
}
