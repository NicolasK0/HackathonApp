//
//  RootView.swift
//  HackathonApp
//
//  Created by Nicolas Kousoulas on 4/6/25.
//

import SwiftUI

struct RootView: View {
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some View {
        Group {
            if authViewModel.user != nil {
                // User is signed in; show the main app content.
                MainDashboardView()
            } else {
                // User is not signed in; show the authentication flow.
                FirebaseAuthView()
            }
        }
        .animation(.easeInOut, value: authViewModel.user)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
