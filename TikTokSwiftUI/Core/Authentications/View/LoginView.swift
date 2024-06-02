//
//  LoginView.swift
//  TikTokSwiftUI
//
//  Created by HardiB.Salih on 6/2/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
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
                }
                
                NavigationLink {
                    ForgotPasswordView()
                } label: {
                    Text("Forgot password?")
                        .padding(.vertical, 12)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                
                
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
                }
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.6)
                
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    SignUpView()
                } label: {
                    HStack (spacing: 3){
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .padding(.top)
                    
                }

            }
            .padding()
        }
    }
}


//MARK: - AuthenticationFormProtocol
extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
            // Trimming whitespace
            let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
            let trimmedPassword = password.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Email validation
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            let isEmailValid = emailPredicate.evaluate(with: trimmedEmail)
            
            // Other validations
            let isPasswordValid = !trimmedPassword.isEmpty && trimmedPassword.count >= 6
            
            return isEmailValid && isPasswordValid
        }
}


#Preview {
    LoginView()
}



