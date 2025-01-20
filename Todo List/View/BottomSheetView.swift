//
//  BottomSheetView.swift
//  Todo List
//
//  Created by Haris Alicic on 20. 1. 2025..
//
//

import SwiftUI

struct BottomSheetView: View {
    @ObservedObject var viewModel: TodoViewModel
    @FocusState private var todoTitleIsFocused: Bool

    var body: some View {
        VStack {
            TextField("Describe your task", text: $viewModel.todoTitle)
                .focused($todoTitleIsFocused)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
                .padding()
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
                .padding(.horizontal, 20)
                .onSubmit {
                    viewModel.addTodo()
                    todoTitleIsFocused = false
                }

            Button(action: {
                viewModel.addTodo()
                todoTitleIsFocused = false
            }) {
                Text("Add todo")
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGray6))
        .cornerRadius(20)
        .ignoresSafeArea(edges: .bottom)
    }
}

//#Preview {
//    BottomSheetView()
//}
