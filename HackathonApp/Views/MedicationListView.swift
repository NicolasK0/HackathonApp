//
//  MedicationListView.swift
//  MedMinderApp
//
//  Created by Nicolas Kousoulas on 4/5/25.
//

import SwiftUI
import FirebaseFirestore

// Updated Medication model with an optional isTaken flag
struct Medication: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var dosage: String
    var instructions: String
    var ndcCode: String?
    var timestamp: Timestamp
    var isTaken: Bool? = false
}

struct MedicationListView: View {
    @State private var medications: [Medication] = []
    
    var body: some View {
        NavigationView {
            List(medications) { med in
                VStack(alignment: .leading, spacing: 5) {
                    Text(med.name)
                        .font(.headline)
                    Text("Dosage: \(med.dosage)")
                        .font(.subheadline)
                    if let code = med.ndcCode, !code.isEmpty {
                        Text("NDC Code: \(code)")
                            .font(.subheadline)
                    }
                    Text("Instructions: \(med.instructions)")
                        .font(.caption)
                        .foregroundColor(.gray)
                    if med.isTaken == true {
                        Text("Taken")
                            .foregroundColor(.green)
                    } else {
                        Text("Not Taken")
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle("My Medications")
        }
        .onAppear(perform: fetchMedications)
    }
    
    func fetchMedications() {
        let db = Firestore.firestore()
        db.collection("medications")
            .order(by: "timestamp", descending: true)
            .addSnapshotListener { snapshot, error in
                if let error = error {
                    print("Error fetching medications: \(error.localizedDescription)")
                    return
                }
                guard let documents = snapshot?.documents else { return }
                medications = documents.compactMap { doc in
                    try? doc.data(as: Medication.self)
                }
            }
    }
}

struct MedicationListView_Previews: PreviewProvider {
    static var previews: some View {
        MedicationListView()
    }
}
