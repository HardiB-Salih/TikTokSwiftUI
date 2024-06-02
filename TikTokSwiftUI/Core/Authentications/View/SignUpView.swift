//
//  SignUpView.swift
//  TikTokSwiftUI
//
//  Created by HardiB.Salih on 6/2/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
    @Environment(\.dismiss) private var dismiss
    
    
    
    var body: some View {
        VStack {
            Spacer()
            Image("tiktok-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack {
                TextField("Enter your email", text: $email)
                    .textInputAutocapitalization(.never)
                    .standerdTextFieldModifier()
                
                SecureField("Enter your Password", text: $password)
                    .standerdTextFieldModifier()
                
                TextField("Enter your fullname", text: $fullname)
                    .textInputAutocapitalization(.never)
                    .standerdTextFieldModifier()
                
                TextField("Enter your username", text: $username)
                    .textInputAutocapitalization(.never)
                    .standerdTextFieldModifier()
            }
            
            
            Button {
                // Sign in Here
            } label: {
                Text("Sign in")
                    .font(.subheadline)
                    .foregroundStyle(.white)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemPink))
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .padding(.vertical)
            }
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.6)
            
            Spacer()
            
            Divider()
            
            Button {
                dismiss()
            } label: {
                HStack (spacing: 3){
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .padding(.top)
            }
        }
        .padding()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    SignUpView()
}


//MARK: - AuthenticationFormProtocol
extension SignUpView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        // Trimming whitespace
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedPassword = password.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedFullname = fullname.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedUsername = username.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Email validation
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let isEmailValid = emailPredicate.evaluate(with: trimmedEmail)
        
        // Other validations
        let isPasswordValid = !trimmedPassword.isEmpty && trimmedPassword.count >= 6
        let isFullnameValid = !trimmedFullname.isEmpty && trimmedFullname.count >= 3
        let isUsernameValid = !trimmedUsername.isEmpty && trimmedUsername.count >= 3
        
        return isEmailValid && isPasswordValid && isFullnameValid && isUsernameValid
    }
}

