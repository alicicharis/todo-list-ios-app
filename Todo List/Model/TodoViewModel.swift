//
//  TodoViewModel.swift
//  Todo List
//
//  Created by Haris Alicic on 20. 1. 2025..
//

import Foundation
import CoreData
import Combine

class TodoViewModel: ObservableObject {
    @Published var todoTitle: String = ""
    @Published var showModal: Bool = false
    @Published var todos: [Todo] = []
    
    private var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        fetchTodos()
    }
    
    func fetchTodos() {
        let request: NSFetchRequest<Todo> = Todo.fetchRequest()
        do {
            todos = try context.fetch(request)
        } catch {
            print("Error fetching todos: \(error)")
        }
    }
    
    func addTodo() {
        let newTodo = Todo(context: context)
        newTodo.id = UUID()
        newTodo.title = todoTitle
        newTodo.desc = ""
        newTodo.timestamp = Date()
        newTodo.done = false
        
        saveContext()
        todoTitle = ""
    }
    
    func deleteTodos(at offsets: IndexSet) {
        for index in offsets {
            context.delete(todos[index])
        }
        saveContext()
    }
    
    func updateStatus(_ todo: Todo) {
        todo.done = !todo.done
        saveContext()
    }
    
    private func saveContext() {
        do {
            try context.save()
            fetchTodos()
        } catch {
            print("Error saving context: \(error)")
        }
    }
}
