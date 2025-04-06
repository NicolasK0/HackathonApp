//
//  MedicationScannerView.swift
//  HackathonApp
//
//  Created by Nicolas Kousoulas on 4/6/25.
//

import SwiftUI

struct MedicationScannerView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Medication Scanner")
                .font(.largeTitle)
            Text("Scanner functionality coming soon...")
                .foregroundColor(.gray)
        }
        .padding()
    }
}

struct MedicationScannerView_Previews: PreviewProvider {
    static var previews: some View {
        MedicationScannerView()
    }
}
