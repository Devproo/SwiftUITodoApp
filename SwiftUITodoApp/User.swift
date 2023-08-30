//
//  User.swift
//  SwiftUITodoApp
//
//  Created by ipeerless on 27/08/2023.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email:String
    let joined: TimeInterval
}
