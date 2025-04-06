//
//  AddMedicationView.swift
//  MedMinderApp
//
//  Created by Nicolas Kousoulas on 4/5/25.
//


import SwiftUI
import FirebaseFirestore

struct AddMedicationView: View {
    @State private var medicationName: String = ""
    @State private var dosage: String = ""
    @State private var instructions: String = ""
    @State private var ndcCode: String = ""
    @State private var message: String = ""
    
    // Firestore reference
    let db = Firestore.firestore()
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Medication Name", text: $medicationName)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            TextField("Dosage (e.g., 2 pills)", text: $dosage)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            TextField("Instructions", text: $instructions)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            TextField("NDC Code (optional)", text: $ndcCode)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            Button(action: addMedication) {
                Text("Add Medication")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            
            if !message.isEmpty {
                Text(message)
                    .foregroundColor(.green)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Add Medication")
    }
    
    func addMedication() {
        let data: [String: Any] = [
            "name": medicationName,
            "dosage": dosage,
            "instructions": instructions,
            "ndcCode": ndcCode,
            "timestamp": Timestamp(date: Date())
        ]
        
        db.collection("medications").addDocument(data: data) { error in
            if let error = error {
                message = "Error: \(error.localizedDescription)"
            } else {
                message = "Medication added successfully!"
                // Reset fields after successful addition
                medicationName = ""
                dosage = ""
                instructions = ""
                ndcCode = ""
            }
        }
    }
}

struct AddMedicationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddMedicationView()
        }
    }
}
