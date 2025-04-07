///
//  TaskDetailsView.swift
//  TaskMaster
//
//  Created by Shalom Aideyan (Student ID: 101222079) on 2025-03-20
//

import SwiftUI
import CoreData

struct TaskDetailsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var task: UserTask

    @State private var isEditing = false
    @State private var title: String = ""
    // Future additions:
    // @State private var description: String = ""
    // @State private var dueDate: Date = Date()
    // @State private var priority: String = "Medium"
    // @State private var category: String = "Work"
    // @State private var reminderEnabled: Bool = false

    var body: some View {
        Form {
            Section(header: Text("Task Details")) {
                TextField("Task Title", text: $title)
            }

            Button(isEditing ? "Save" : "Edit") {
                if isEditing {
                    task.title = title
                    try? viewContext.save()
                } else {
                    title = task.title ?? ""
                }
                isEditing.toggle()
            }
        }
        .navigationTitle("Task Info")
        .onAppear {
            title = task.title ?? ""
        }
    }
}

struct TaskDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        let sampleTask = UserTask(context: context)
        sampleTask.title = "Preview Task"
        sampleTask.dateCreated = Date()

        return NavigationView {
            TaskDetailsView(task: sampleTask)
                .environment(\.managedObjectContext, context)
        }
    }
}
