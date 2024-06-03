//
//  AuthService.swift
//  TikTokSwiftUI
//
//  Created by HardiB.Salih on 6/2/24.
//

import Firebase

@MainActor
/// A service that manages user authentication and user data operations.
class AuthService {
    
    /// The current user session, published for observers.
    @Published var userSession: FirebaseAuth.User?
    
    /// Updates the current user session by fetching the current authenticated user from Firebase.
    func updateUserSession() {
        self.userSession = Auth.auth().currentUser
    }
    
    /// Logs in a user with the specified email and password.
    ///
    /// - Parameters:
    ///   - email: The email address of the user.
    ///   - password: The password of the user.
    /// - Throws: An error if the login fails.
    func login(withEmail email: String, password: String) async throws {
        
        do{
            let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = authResult.user
        } catch {
            throw error
        }
    }
    
    /// Creates a new user with the specified email, full name, username, and password.
    ///
    /// - Parameters:
    ///   - email: The email address of the user.
    ///   - fullname: The full name of the user.
    ///   - username: The username of the user.
    ///   - password: The password of the user.
    /// - Throws: An error if the user creation or Firestore operation fails.
    func createUser(withEmail email: String,
                    fullname: String,
                    username: String,
                    password: String) async throws {
        do {
            let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = authResult.user
            try await uploadUserData(id: authResult.user.uid, email: email, fullname: fullname, username: username)
        } catch {
            throw error
        }
        
    }
    
    
    /**
     Uploads user data to the Firestore database.
     
     - Parameters:
       - id: The unique identifier for the user.
       - email: The email address of the user.
       - fullname: The full name of the user.
       - username: The username of the user.
     
     - Throws: An error if there is a problem uploading the user data to the database.
     
     - Note: This function is asynchronous and may suspend execution. Ensure to call it from an asynchronous context.
     */
    private func uploadUserData(id: String, email: String, fullname: String, username: String) async throws {
        let user = User(id: id, email: email, username: username, fullname: fullname, timestamp:  Timestamp())
        
        do {
            try await UserService().uploadUserData(user)
        } catch {
            throw error
        }
    }
    
    
    /// Sends a password reset email to the specified email address.
    ///
    /// - Parameter email: The email address to send the password reset link to.
    /// - Throws: An error if the password reset fails.
    func resetPassword(withEmail email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }

    /// Signs out the current user.
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            // Optionally, handle any additional sign-out logic here
        } catch {
            print("Error signing out: %@", error.localizedDescription)
            // Optionally, handle the error (e.g., show an alert to the user)
        }
    }

    
    
}
