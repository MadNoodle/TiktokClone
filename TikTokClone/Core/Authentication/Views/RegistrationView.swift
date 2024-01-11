//
//  RegistrationView.swift
//  TikTokClone
//
//  Created by User on 11.1.2024.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.dismiss) var dismiss
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
    
    var body: some View {
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
                
                TextField(text: self.$fullname) {
                    Text("Enter your fullname")
                }
                .standard()
                
                TextField(text: self.$username) {
                    Text("Enter your username")
                }
                .standard()
            }
            Button(action: {
                print("DEBUG: login")
            }, label: {
                Text("Sign up")
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
            
            Button(action: {
                self.dismiss()
            }, label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    
                    Text("Sign in")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .padding(.vertical)
            })
            
        }
    }
}

#Preview {
    RegistrationView()
}

// MARK: - Form Validation
extension RegistrationView: AuthentificationFormProtocol {
    
    var isFormValid: Bool {
        return !self.email.isEmpty
        && self.email.contains("@")
        && !self.password.isEmpty
        && self.password.count > 5
        && !self.username.isEmpty
        && !self.fullname.isEmpty
    }
}
