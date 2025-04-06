//
//  JargonDecoderView.swift
//  HackathonApp
//
//  Created by Nicolas Kousoulas on 4/6/25.
//

import SwiftUI

struct JargonDecoderView: View {
    @State private var prescriptionText: String = ""
    @State private var decodedInfo: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Prescription Decoder")
                    .font(.largeTitle)
                
                TextField("Enter prescription details...", text: $prescriptionText)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                Button(action: decodePrescription) {
                    Text("Decode")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                
                if !decodedInfo.isEmpty {
                    Text("Decoded Info:")
                        .font(.headline)
                    Text(decodedInfo)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Jargon Decoder")
        }
    }
    
    func decodePrescription() {
        // Dummy implementation. You could integrate an API or more complex logic here.
        decodedInfo = "This medication is used to treat high blood pressure."
    }
}

struct JargonDecoderView_Previews: PreviewProvider {
    static var previews: some View {
        JargonDecoderView()
    }
}
