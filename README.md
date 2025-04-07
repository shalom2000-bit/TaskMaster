# 📱 TaskMaster – iOS Task Manager App

**TaskMaster** is a SwiftUI-based iOS app designed to help users manage their daily tasks efficiently. It includes features like task creation, organization by status, reminders, and customizable settings.

---

## 🧠 Features
- Create and manage tasks with title, description, due date, and category
- View tasks grouped by status: To-Do, In Progress, Completed
- Color-coded for due dates (red = overdue, yellow = upcoming)
- Set reminders and receive notifications
- Support for dark mode and iCloud/Firebase sync
- Core Data used for local persistence

---

## 👥 Team Contributions

### 👤 **Shalom Aideyan (101222079)**
- `Task.swift` – Defines the `Task` struct with properties for managing task data
- `TaskStatus.swift` – Enum used to categorize tasks by status
- `TaskCreationView.swift` – View for adding new tasks
- `TaskListView.swift` – Displays tasks grouped by status with swipe actions
- `LaunchScreen.swift` – Splash screen UI for app startup
- `UserTaskModel.xcdatamodeld` – Core Data schema

### 👤 **Vish (101429635)**
- `TaskDetailsView.swift` – Full details of individual tasks, editing and updating
- `SettingsView.swift` – Manages user preferences (dark mode, sync, etc.)
- `NotificationsView.swift` – Reminder toggle and notification settings
- `ContentView.swift` – Handles tab-based navigation across app screens
- `TaskMasterApp.swift` – Main app entry point with environment setup
- `PersistenceController.swift` – Sets up Core Data stack
- `UserTask+CoreDataClass.swift`, `UserTask+CoreDataProperties.swift` – Core Data model files

---

## 🛠️ Tech Stack
- SwiftUI
- Core Data
- Xcode 15, Target: iPhone 13, Portrait Mode
- Optional Firebase Sync (Coming Soon)

---

## 🧾 Notes
- All task views follow Apple’s Human Interface Guidelines
- Responsive layout with accessibility support
- Works offline with local data persistence


