import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                TaskListView()
            }
            .tabItem {
                Label("Tasks", systemImage: "list.bullet")
            }

            NavigationView {
                TaskCreationView()
            }
            .tabItem {
                Label("Add Task", systemImage: "plus.circle")
            }

            NavigationView {
                NotificationsView()
            }
            .tabItem {
                Label("Notifications", systemImage: "bell")
            }

            NavigationView {
                SettingsView()
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape")
            }
        }
    }
}
