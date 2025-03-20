// NotificationsView.swift
// Created by Shalom Aideyan (Student ID: 101222079) on 2025-03-20
// Edited by Vishaliny Sriragunathan (Student ID: 101429635) on 2025-03-20 - Added notification messages

import SwiftUI

struct NotificationsView: View {
    let notifications = [
        "Task deadline approaching.",
        "Review health task progress.",
        "New task added to list.",
        "Task completed successfully.",
        "Special task offer available.",
        "Task overdue, please complete.",
        "Reminder: incomplete task pending.",
        "Subscribe for task updates.",
        "Task reminder set for tomorrow."
    ]
    
    var body: some View {
        List(notifications, id: \.self) { notification in
            Text(notification)
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
