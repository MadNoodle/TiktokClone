//
//  LoginView.swift
//  TikTokClone
//
//  Created by User on 11.1.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginViewModel: LoginViewModel
    private let authService: AuthServiceProtocol
    @State private var email = ""
    @State private var password = ""
    
    init(authService: AuthServiceProtocol) {
        self.authService = authService
        self._loginViewModel = StateObject(wrappedValue: LoginViewModel(authService: authService))
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // Logo
                Image(.logo)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .padding()
                
                // TextFields
                VStack {
                    TextField(text: self.$email) {
                        Text("Enter your email")
                    }
                    .textInputAutocapitalization(.never)
                    .standard()
                    
                    SecureField(text: self.$password) {
                        Text("Enter your password")
                    }
                    .standard()
                }
                
                // Forgot Button
                NavigationLink {
                    
                } label: {
                    Text("Forgot password")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 20)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                // Login Button
                Button(action: {
                    self.loginViewModel.login(withEmail: self.email, password: self.password)
                }, label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 350, height: 44)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                })
                .padding(.vertical)
                .disabled(!self.isFormValid)
                .opacity(self.isFormValid ? 1.0 : 0.7)
                
                Spacer()
                
                Divider()
                NavigationLink {
                    RegistrationView(authService: self.authService)
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .padding(.vertical)
                }
                
            }
        }
    }
}

#Preview {
    LoginView(authService: DIContainer.mock.authService)
}

// MARK: - Validation Protocol
extension LoginView: AuthentificationFormProtocol {
    
    var isFormValid: Bool {
        return !self.email.isEmpty 
        && self.email.contains("@")
        && !self.password.isEmpty
        && self.password.count > 5
    }
}
