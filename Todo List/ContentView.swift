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
    @State private var showModal: Bool = false
    @FocusState private var todoTitleIsFocused: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(todoList) { todo in
                        NavigationLink(destination: TodoItemView(todoTitle: todo.title ?? "No title")) {
                            Text(todo.title ?? "Default value")
                        }
                    }
                    .onDelete(perform: deleteTodo)
                }
                .navigationTitle("Todo List")
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            showModal = true
                        }) {
                            Image(systemName: "plus")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .clipShape(Circle())
                                .shadow(radius: 10)
                        }
                        .padding()
                        .sheet(isPresented: $showModal, content: {
                            BottomSheetView()
                                .presentationDetents([.medium, .fraction(0.3)])
                        })
                    }
                }
            }
        }
//        HStack {
//            TextField(
//                "Add todo text",
//                text: $todoTitle
//                
//            )
//            .textInputAutocapitalization(.never)
//            .autocorrectionDisabled(true)
//            .padding()
//            .background(Color(.systemGray6))
//            .cornerRadius(10)
//            .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
//            .padding(.horizontal, 20)
//            
//            Button {
//                if todoTitle.isEmpty {
//                    return
//                }
//                
//                let newTodo = Todo(context: moc)
//                newTodo.desc = "Description"
//                newTodo.id = UUID()
//                newTodo.title = todoTitle
//                newTodo.timestamp = Date()
//                newTodo.done = false
//                
//                try? moc.save()
//                
//                todoTitle = ""
//                
//            } label: {
//                Image(systemName: "plus")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 25, height: 25)
//                    .foregroundStyle(.blue)
//            }
//            
//            
//        }
//        .padding(.horizontal, 10)
        
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
