//
//  OnboardingView.swift
//  HackathonApp
//
//  Created by Nicolas Kousoulas on 4/6/25.
//


import SwiftUI

struct OnboardingView: View {
    @State private var age: String = ""
    @State private var caregiverEmail: String = ""
    @State private var errorMessage: String = ""
    @State private var onboardingComplete = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Tell Us More")
                    .font(.largeTitle)
                    .bold()
                
                TextField("Age", text: $age)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                TextField("Caregiver Email", text: $caregiverEmail)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
                
                Button(action: saveInfo) {
                    Text("Continue")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                
                NavigationLink(destination: MainDashboardView(), isActive: $onboardingComplete) {
                    EmptyView()
                }
            }
            .padding()
            .navigationTitle("Onboarding")
        }
    }
    
    func saveInfo() {
        // Validate fields and save info as needed (e.g., to Firestore)
        if age.isEmpty || caregiverEmail.isEmpty {
            errorMessage = "Please fill in all fields."
        } else {
            // Save the extra information if required...
            onboardingComplete = true
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
