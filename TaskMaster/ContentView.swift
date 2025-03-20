// ContentView.swift
// Created by Shalom Aideyan (Student ID: 101222079) on 2025-03-20
// Edited by Vishaliny Sriragunathan (Student ID: 101429635) on 2025-03-20 - Added color logic for task status
// Edited by Shalom Aideyan (Student ID: 101222079) on 2025-03-20 - Added TabView for navigation

import SwiftUI

struct ContentView: View {
    @State private var tasks: [Task] = [
        Task(title: "Finish project", dueDate: Date(timeIntervalSinceNow: -86400), status: .toDo),
        Task(title: "Call mom", dueDate: Date(timeIntervalSinceNow: 3600), status: .inProgress),
        Task(title: "Buy groceries", dueDate: Date(timeIntervalSinceNow: 172800), status: .toDo)
    ]
    @State private var showingTaskCreation = false
    
    var body: some View {
        TabView {
            NavigationView {
                ZStack {
                    TaskListView(tasks: $tasks)
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button(action: {
                                showingTaskCreation = true
                            }) {
                                Image(systemName: "plus")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .frame(width: 60, height: 60)
                                    .background(Color.blue)
                                    .clipShape(Circle())
                                    .shadow(radius: 4)
                            }
                            .padding()
                        }
                    }
                }
                .navigationTitle("TaskMaster")
                .sheet(isPresented: $showingTaskCreation) {
                    TaskCreationView(tasks: $tasks)
                }
            }
            .tabItem {
                Label("Home", systemImage: "list.bullet")
            }
            
            NavigationView {
                SettingsView()
            }
            .tabItem {
                Label("Settings", systemImage: "gear")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
