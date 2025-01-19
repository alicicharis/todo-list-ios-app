//
//  Todo_ListApp.swift
//  Todo List
//
//  Created by Haris Alicic on 19. 1. 2025..
//

import SwiftUI

@main
struct Todo_ListApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
