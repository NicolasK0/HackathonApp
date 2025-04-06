//
//  HackathonAppApp.swift
//  HackathonApp
//
//  Created by Nicolas Kousoulas on 4/6/25.
//


import SwiftUI
import Firebase
import UserNotifications

@main
struct HackathonAppApp: App {
    init() {
        FirebaseApp.configure()
        requestNotificationPermissions()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
    
    func requestNotificationPermissions() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Notification permission granted.")
            } else if let error = error {
                print("Notification permission error: \(error.localizedDescription)")
            }
        }
    }
}

