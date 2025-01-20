//
//  BottomSheetView.swift
//  Todo List
//
//  Created by Haris Alicic on 20. 1. 2025..
//

import SwiftUI

struct BottomSheetView: View {
    @State private var todoTitle = ""
    @FocusState private var todoTitleIsFocused: Bool
    
    var body: some View {
        VStack {
            //            Text("This is a bottom sheet modal")
            //                .font(.headline)
            //                .padding()
            //            Spacer()
            TextField(
                "Add todo text",
                text: $todoTitle
                
            )
            .focused($todoTitleIsFocused)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled(true)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
            .padding(.horizontal, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGray6))
        .cornerRadius(20)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    BottomSheetView()
}
