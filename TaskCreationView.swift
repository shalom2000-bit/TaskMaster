// TaskCreationView.swift
// Created by Shalom Aideyan (Student ID: 101222079) on 2025-03-20
// Edited by Vishaliny Sriragunathan (Student ID: 101429635) on 2025-03-20 - Added due date picker

import SwiftUI

struct TaskCreationView: View {
    @Binding var tasks: [Task]
    @State private var title: String = ""
    @State private var dueDate: Date = Date()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Details")) {
                    TextField("Task Title", text: $title)
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: [.date, .hourAndMinute])
                }
            }
            .navigationTitle("Add Task")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let newTask = Task(title: title.isEmpty ? "Untitled Task" : title, dueDate: dueDate, status: .toDo)
                        tasks.append(newTask)
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
}

struct TaskCreationView_Previews: PreviewProvider {
    static var previews: some View {
        TaskCreationView(tasks: .constant([]))
    }
}
