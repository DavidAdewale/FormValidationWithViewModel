//
//  ContentView.swift
//  FormValidationWithViewModel
//
//  Created by David Adewale on 11/07/2024.
//

import SwiftUI

struct LoginState {
    var email: String = ""
    var password: String = ""
    var emailError: LoginError?
    var passwordError: LoginError?
    
    mutating func isValid() -> Bool {
        if email.isEmpty {
            emailError = LoginError.emailEmpty
        } else if !email.isValidEmail {
            emailError = LoginError.emailInvalid
        }
        
        if(password.isEmpty) {
            passwordError = LoginError.passwordEmpty
        }
        
        return emailError == nil && passwordError == nil
    }
}

struct LoginView: View {
    
    @State private var loginState = LoginState()
    
    var body: some View {
        Form {
            TextField("Email", text: $loginState.email)
                .textInputAutocapitalization(.never)
            if let emailError = loginState.emailError {
                Text(emailError.localizedDescription)
                    .font(.caption)
            }
            SecureField("Password", text: $loginState.password)
            if let passwordError = loginState.passwordError {
                Text(passwordError.localizedDescription)
                    .font(.caption)
            }
            
            Button("Login") {
                if loginState.isValid()
                {
                    //login
                }            }
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
