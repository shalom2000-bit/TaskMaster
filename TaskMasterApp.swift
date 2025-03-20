// TaskMasterApp.swift
// Created by Shalom Aideyan (Student ID: 101222079) on 2025-03-20
// Edited by Shalom Aideyan (Student ID: 101222079) on 2025-03-20 - Added app-wide dark mode support

import SwiftUI

@main
struct TaskMasterApp: App {
    @AppStorage("isDarkModeEnabled") private var isDarkModeEnabled = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkModeEnabled ? .dark : .light)
        }
    }
}
