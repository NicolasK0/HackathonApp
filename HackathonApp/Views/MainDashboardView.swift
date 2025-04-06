//
//  MainDashboardView.swift
//  HackathonApp
//
//  Created by Nicolas Kousoulas on 4/6/25.
//

import SwiftUI

struct MainDashboardView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Welcome to the Dashboard!")
                    .font(.largeTitle)
                    .padding()
                
                NavigationLink(destination: MedicationScannerView()) {
                    Text("Scan Medication")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(8)
                }
                NavigationLink(destination: ContentView()) {
                    Text("Manage Medications")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(8)
                }
                NavigationLink(destination: JargonDecoderView()) {
                    Text("Decode Prescription Info")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .cornerRadius(8)
                }
            }
            .padding()
            .navigationTitle("Dashboard")
        }
    }
}

struct MainDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        MainDashboardView()
    }
}
