// Task.swift
// Created by Shalom Aideyan (Student ID: 101222079) on 2025-03-20

import Foundation

struct Task: Identifiable {
    let id = UUID() // Unique identifier for each task
    let title: String
    let dueDate: Date
    var status: TaskStatus
    
    enum TaskStatus: String {
        case toDo = "To-Do"
        case inProgress = "In Progress"
        case completed = "Completed"
    }
}
