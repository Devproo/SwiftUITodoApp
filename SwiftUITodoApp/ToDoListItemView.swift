//
//  ToDoListItemView.swift
//  SwiftUITodoApp
//
//  Created by ipeerless on 30/08/2023.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
            }
            Spacer()
           
            Button(action: {
                viewModel.toggleIsDone(item: item)
            }, label: {
                Image(systemName: item.isDone ?  "checkmark.circle.fill" : "circle")
                    .foregroundStyle(.blue)
            })
        }
        
        
    }
}

#Preview {
    ToDoListItemView(item: .init(id: "123", title: "do any thing", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
