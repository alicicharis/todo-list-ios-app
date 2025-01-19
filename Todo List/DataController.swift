//
//  DataController.swift
//  Todo List
//
//  Created by Haris Alicic on 19. 1. 2025..
//

import CoreData
import Foundation


class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Todolist")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load \(error.localizedDescription)")
            }
            
        }
    }
}
