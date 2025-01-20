//
//  TodoItemView.swift
//  Todo List
//
//  Created by Haris Alicic on 20. 1. 2025..
//

import SwiftUI

struct TodoItemView: View {
    var todoTitle: String = ""
    
    var body: some View {
        Text(todoTitle)
    }
}

#Preview {
    TodoItemView()
}
