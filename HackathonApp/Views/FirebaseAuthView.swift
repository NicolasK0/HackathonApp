//
//  FirebaseAuthView.swift
//  MedMinderApp
//
//  Created by Nicolas Kousoulas on 4/5/25.
//


import SwiftUI
import Firebase
import FirebaseAuth

struct FirebaseAuthView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage: String?
    @State private var isSignedIn = false

    var body: some View {
        NavigationView {
            if isSignedIn {
                // Once signed in, show your main content.
                Text("Welcome!")
                    .font(.largeTitle)
                    .padding()
            } else {
                VStack(spacing: 20) {
                    Text("Sign In")
                        .font(.largeTitle)

                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }

                    Button(action: signIn) {
                        Text("Sign In")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)

                    // 1) ADD THIS "Sign Up" BUTTON
                    NavigationLink(destination: SignUpView()) {
                        Text("Don't have an account? Sign up here")
                            .foregroundColor(.blue)
                    }
                }
                .navigationTitle("Firebase Auth")
            }
        }
    }
    
    private func signIn() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                // Sign in successful.
                isSignedIn = true
            }
        }
    }
}
