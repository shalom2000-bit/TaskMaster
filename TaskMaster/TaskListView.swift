// TaskListView.swift
// Created by Shalom Aideyan (Student ID: 101222079) on 2025-03-20
// Edited by Vishaliny Sriragunathan (Student ID: 101429635) on 2025-03-20 - Added color logic for task status
// Edited by Shalom Aideyan (Student ID: 101222079) on 2025-03-20 - Fixed tap-to-complete and added navigation to Task Details

import SwiftUI

struct TaskListView: View {
    @Binding var tasks: [Task]
    
    var body: some View {
        List {
            ForEach(tasks) { task in
                NavigationLink(destination: TaskDetailsView(task: task)) {
                    HStack {
                        Text(task.title)
                            .foregroundColor(taskColor(task: task))
                        Spacer()
                        Text(task.status.rawValue)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .onTapGesture {
                    // Toggle task status on tap
                    if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                        tasks[index].status = tasks[index].status == .completed ? .toDo : .completed
                    }
                }
            }
            .onDelete(perform: deleteTask)
        }
    }
    
    private func taskColor(task: Task) -> Color {
        let now = Date()
        if task.status == .completed {
            return .black
        } else if task.dueDate < now {
            return .red
        } else if task.dueDate < now.addingTimeInterval(86400) {
            return .yellow
        } else {
            return .black
        }
    }
    
    private func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView(tasks: .constant([
            Task(title: "Sample Task", dueDate: Date(), status: .toDo)
        ]))
    }
}
