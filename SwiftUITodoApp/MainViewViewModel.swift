//
//  MainViewViewModel.swift
//  SwiftUITodoApp
//
//  Created by ipeerless on 27/08/2023.
//
import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        
      
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user  in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
                
            }
        }
    }
    
    public func isSignedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }
}
