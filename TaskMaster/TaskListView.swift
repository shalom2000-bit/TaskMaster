//
//  TaskListView.swift
//  TaskMaster
//
//  Created by Shalom Aideyan (Student ID: 101222079) on 2025-03-20
//

import SwiftUI
import CoreData

struct TaskListView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \UserTask.dateCreated, ascending: true)],
        animation: .default)
    private var tasks: FetchedResults<UserTask>

    var body: some View {
        List {
            ForEach(tasks) { task in
                NavigationLink(destination: TaskDetailsView(task: task)) {
                    HStack {
                        Text(task.title ?? "Untitled")
                            .foregroundColor(.primary)
                        Spacer()
                        Text(task.dateCreated != nil ? formatDate(task.dateCreated!) : "")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            .onDelete(perform: deleteTask)
        }
        .navigationTitle("Your Tasks")
    }

    private func deleteTask(at offsets: IndexSet) {
        for index in offsets {
            viewContext.delete(tasks[index])
        }
        try? viewContext.save()
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
