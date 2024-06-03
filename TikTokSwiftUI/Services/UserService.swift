//
//  UserService.swift
//  TikTokSwiftUI
//
//  Created by HardiB.Salih on 6/3/24.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth



struct UserService {
    
    func fetchCurrentUser() async throws -> User? {
        guard let currentUid = Auth.auth().currentUser?.uid else { return nil}
        do {
            return try await FirestoreCollections.users.document(currentUid).getDocument(as:  User.self)
        } catch  {
            throw error
        }
    }
    
    
    
    /// Uploads user data to the Firestore "users" collection.
    ///
    /// This function encodes a `User` object into a format suitable for Firestore
    /// and uploads it to the "users" collection. The document is identified by the user's ID.
    ///
    /// - Parameter user: The `User` object to be uploaded to Firestore.
    /// - Throws: An error if the encoding or upload operation fails.
    ///
    /// Example usage:
    /// ```
    /// let user = User(id: "123", name: "John Doe", email: "john.doe@example.com")
    /// do {
    ///     try await uploadUserData(user)
    ///     // User data successfully uploaded
    /// } catch {
    ///     print("Failed to upload user data: \(error)")
    /// }
    /// ```
    func uploadUserData(_ user: User) async throws {
        do {
            let userData = try Firestore.Encoder().encode(user)
            try await FirestoreCollections.users.document(user.id).setData(userData)
        } catch {
            throw error
        }
    }

    
    /// Fetches the list of users from the Firestore "users" collection.
    ///
    /// This function performs an asynchronous operation to retrieve user documents
    /// from the Firestore "users" collection and converts them into an array of `User` objects.
    ///
    /// - Returns: An array of `User` objects retrieved from Firestore.
    /// - Throws: An error if the fetch operation fails.
    ///
    /// Example usage:
    /// ```
    /// do {
    ///     let users = try await fetchUsers()
    ///     // Use the array of users
    /// } catch {
    ///     print("Failed to fetch users: \(error)")
    /// }
    /// ```
    func fetchUsers() async throws -> [User] {
        do {
            let snapshot = try await FirestoreCollections.users.getDocuments()
            return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
        } catch {
            throw error
        }
    }
}
