//
//  AuthViewModel.swift
//  HackathonApp
//
//  Created by Nicolas Kousoulas on 4/6/25.
//

import SwiftUI
import Firebase
import FirebaseAuth


class AuthViewModel: ObservableObject {
    @Published var user: User?
    
    init() {
        // Listen for auth state changes
        Auth.auth().addStateDidChangeListener { auth, user in
            self.user = user
        }
    }
}
