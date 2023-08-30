//
//  NewItemViewViewModel.swift
//  SwiftUITodoApp
//
//  Created by ipeerless on 27/08/2023.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var  showAlert = false
    
    init(){}
    func save() {
        guard  canSave else {
            return
        }
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let  newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        
        
        let db = Firestore.firestore()
        db.collection("users").document(uid).collection("todos").document(newId)
            .setData(newItem.asDictionary())
    }
    var  canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return  false
        }
        guard  dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}
