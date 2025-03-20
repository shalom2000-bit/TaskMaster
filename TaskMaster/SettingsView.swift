// SettingsView.swift
// Created by Shalom Aideyan (Student ID: 101222079) on 2025-03-20
// Edited by Vishaliny Sriragunathan (Student ID: 101429635) on 2025-03-20 - Added notification preferences toggle
// Edited by Shalom Aideyan (Student ID: 101222079) on 2025-03-20 - Added new settings sections

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkModeEnabled") private var isDarkModeEnabled = false
    @State private var isSyncEnabled = false
    @State private var areNotificationsEnabled = true
    @State private var showingLogoutAlert = false
    
    var body: some View {
        Form {
            // Appearance
            Section(header: Text("Appearance")) {
                Toggle("Dark Mode", isOn: $isDarkModeEnabled)
            }
            
            // Data Sync
            Section(header: Text("Data Sync")) {
                Toggle("Sync with iCloud/Firebase", isOn: $isSyncEnabled)
            }
            
            // Notifications
            Section(header: Text("Notifications")) {
                Toggle("Enable Notifications", isOn: $areNotificationsEnabled)
            }
            
            // My Account
            Section(header: Text("My Account")) {
                NavigationLink("Profile") {
                    Text("Profile Details\nName: Shalom Aideyan\nEmail: shalomaideyan@gmail.com")
                        .multilineTextAlignment(.center)
                        .padding()
                }
                NavigationLink("Change Password") {
                    Text("Change Password Screen\n(Simulated for Early Prototype)")
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }
            
            // My Subscription
            Section(header: Text("My Subscription")) {
                NavigationLink("Subscription Status") {
                    Text("Subscription Status\nPlan: Free Tier\nUpgrade to Pro for more features!")
                        .multilineTextAlignment(.center)
                        .padding()
                }
                NavigationLink("Manage Subscription") {
                    Text("Manage Subscription Screen\n(Simulated for Early Prototype)")
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }
            
            // General
            Section(header: Text("General")) {
                NavigationLink("Language") {
                    Text("Language Settings\nCurrent: English")
                        .multilineTextAlignment(.center)
                        .padding()
                }
                NavigationLink("Notifications Preferences") {
                    Text("Notification Preferences\n(Simulated for Early Prototype)")
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }
            
            // Help
            Section(header: Text("Help")) {
                NavigationLink("FAQ") {
                    Text("Frequently Asked Questions\n(Simulated for Early Prototype)")
                        .multilineTextAlignment(.center)
                        .padding()
                }
                NavigationLink("Contact Support") {
                    Text("Contact Support\nEmail: support@taskmaster.com")
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }
            
            // Log Out
            Section {
                Button(action: {
                    showingLogoutAlert = true
                }) {
                    Text("Log Out")
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .alert(isPresented: $showingLogoutAlert) {
                    Alert(
                        title: Text("Log Out"),
                        message: Text("Are you sure you want to log out?"),
                        primaryButton: .destructive(Text("Log Out")) {
                            // Simulated logout action
                            print("User logged out (simulated)")
                        },
                        secondaryButton: .cancel()
                    )
                }
            }
        }
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView()
        }
    }
}
