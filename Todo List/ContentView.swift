//
//  ContentView.swift
//  Todo List
//
//  Created by Haris Alicic on 19. 1. 2025..
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var todoList: FetchedResults<Todo>
    
    @State private var todoTitle: String = ""
    @FocusState private var todoTitleIsFocused: Bool
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todoList) { todo in
                    NavigationLink(todo.title ?? "Default value", destination: Text("Destination Text"))
                }
                .onDelete(perform: deleteTodo)
            }
            .navigationTitle("Todo List")
        }
        
        HStack {
            TextField(
                "Add todo text",
                text: $todoTitle
                
            )
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled(true)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
            .padding(.horizontal, 20)
            
            Button {
                if todoTitle.isEmpty {
                    return
                }
                
                let newTodo = Todo(context: moc)
                newTodo.desc = "Description"
                newTodo.id = UUID()
                newTodo.title = todoTitle
                newTodo.timestamp = Date()
                newTodo.done = false
                
                try? moc.save()
                
                todoTitle = ""
                
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .foregroundStyle(.blue)
            }
            
            
        }
        .padding(.horizontal, 10)
        
    }
    
    func deleteTodo(at offsets: IndexSet) {
        for index in offsets {
            let todo = todoList[index]
            moc.delete(todo)
        }
        
        try? moc.save()
    }
}


#Preview {
    ContentView()
}
