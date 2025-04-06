//
//  ContentView.swift
//  MedMinderApp
//
//  Created by Nicolas Kousoulas on 4/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Display your mascot image (make sure "mrpill" is added to your assets)
                Image("mrpill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding()
                
                NavigationLink(destination: AddMedicationView()) {
                    Text("Add Medication")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                NavigationLink(destination: MedicationListView()) {
                    Text("View Medications")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(8)
                }
            }
            .padding()
            .navigationTitle("MedMinder")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
