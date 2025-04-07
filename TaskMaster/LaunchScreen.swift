// LaunchScreen.swift
// Created by Shalom Aideyan (Student ID: 101222079) on 2025-03-20
// Edited by Vishaliny Sriragunathan (Student ID: 101429635) on 2025-03-20 - Added team member names

import SwiftUI

struct LaunchScreen: View {
    @Binding var showLaunchScreen: Bool
    
    var body: some View {
        VStack {
            Text("TaskMaster")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text("Created by:")
                .font(.title2)
            Text("Shalom Aideyan (101222079)")
            Text("Vishaliny Sriragunathan (101429635)")
        }
        .onAppear {
            // Hide the launch screen after 2 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    showLaunchScreen = false
                }
            }
        }
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen(showLaunchScreen: .constant(true))
    }
}
