// TaskDetailsView.swift
// Created by Shalom Aideyan (Student ID: 101222079) on 2025-03-20
// Edited by Vishaliny Sriragunathan (Student ID: 101429635) on 2025-03-20 - Added notification messages

import SwiftUI

struct TaskDetailsView: View {
    let task: Task
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Task Details
            Text("Title: \(task.title)")
                .font(.title)
            Text("Due Date: \(task.dueDate, style: .date) \(task.dueDate, style: .time)")
            Text("Status: \(task.status.rawValue)")
            
            // Notifications Section
            Text("Notifications")
                .font(.headline)
            NotificationsView()
            
            Spacer()
        }
        .padding()
        .navigationTitle("Task Details")
    }
}

struct TaskDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailsView(task: Task(title: "Sample Task", dueDate: Date(), status: .toDo))
    }
}
