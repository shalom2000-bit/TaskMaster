//
//  TaskMasterApp.swift
//  TaskMaster
//
//  Created by Shalom Aideyan (Student ID: 101222079) on 2025-03-20
//

import SwiftUI

@main
struct TaskMasterApp: App {
   // @AppStorage("isDarkModeEnabled") private var isDarkModeEnabled = false

    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
               // .preferredColorScheme(isDarkModeEnabled ? .dark : .light)
        }
    }
}

