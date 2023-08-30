//
//  ToDoListItem.swift
//  SwiftUITodoApp
//
//  Created by ipeerless on 27/08/2023.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone  =  state
    }
}
