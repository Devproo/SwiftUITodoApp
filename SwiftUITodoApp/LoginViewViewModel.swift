//
//  LoginViewViewModel.swift
//  SwiftUITodoApp
//
//  Created by ipeerless on 27/08/2023.
//
import FirebaseAuth
import Foundation


class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(email: String = "", password: String = "") {
        self.email = email
        self.password = password
    }
    
    func login()  {
        
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func validate() -> Bool {
        
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty ,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Plz fill in all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            
            errorMessage = "Enter valid email"
            return false
        }
        return true
    }
    
}
