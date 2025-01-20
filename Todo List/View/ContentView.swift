//
//  ContentView.swift
//  Todo List
//
//  Created by Haris Alicic on 19. 1. 2025..
//


import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var moc
    @StateObject private var viewModel: TodoViewModel
    
    init(moc: NSManagedObjectContext) {
        _viewModel = StateObject(wrappedValue: TodoViewModel(context: moc))
    }
    
    var body: some View {
        ZStack {
            List {
                Section ("Todo List") {
                    ForEach(viewModel.todos) { todo in
                        HStack {
                            Text(todo.title ?? "Default value")
                                .strikethrough(todo.done, color: .black)
                            Spacer()
                            
                            if todo.done {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundStyle(Color.blue)
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            if todo.done == false {
                                viewModel.updateStatus(todo)
                            } else {
                                viewModel.updateStatus(todo)
                            }
                        }
                    }
                }
                
//                Section {
//                    Text("Test test")
//                } header: {
//                    Text("header")
//                } footer: {
//                    Text("Footer")
//                }
//                .headerProminence(.increased)
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: { viewModel.showModal = true }) {
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                    .padding()
                    .sheet(isPresented: $viewModel.showModal) {
                        BottomSheetView(viewModel: viewModel)
                            .presentationDetents([.medium, .fraction(0.3)])
                    }
                }
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
