import SwiftUI

struct TaskCreationView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss

    @State private var title = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @State private var priority = "Medium"
    @State private var category = "Work"
    @State private var reminderEnabled = false

    let priorities = ["Low", "Medium", "High"]
    let categories = ["Work", "Personal", "Shopping"]

    var body: some View {
        Form {
            Section(header: Text("Task Info")) {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: [.date, .hourAndMinute])
                Picker("Priority", selection: $priority) {
                    ForEach(priorities, id: \.self) { Text($0) }
                }
                Picker("Category", selection: $category) {
                    ForEach(categories, id: \.self) { Text($0) }
                }
                Toggle("Remind Me", isOn: $reminderEnabled)
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
                    let newTask = UserTask(context: viewContext)
                    newTask.title = title.isEmpty ? "Untitled Task" : title
                    newTask.dateCreated = Date()

                    // The below lines are optional — they won't compile unless you add these fields to your Core Data model
                    // newTask.descriptionText = description
                    // newTask.dueDate = dueDate
                    // newTask.priority = priority
                    // newTask.category = category
                    // newTask.reminderEnabled = reminderEnabled

                    try? viewContext.save()
                    dismiss()
                }
            }
        }
    }
}
