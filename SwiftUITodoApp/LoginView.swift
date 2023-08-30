//
//  LoginView.swift
//  SwiftUITodoApp
//
//  Created by ipeerless on 27/08/2023.
//

import SwiftUI

struct LoginView: View {
   @StateObject private var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "To Do List", subTitle: "Get things done", angle: 15, background: .red)
                
                
                Form {
                    if !viewModel.errorMessage.isEmpty {
                     Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                      
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Log In", background: .blue, action: {
                        
                        viewModel.login()
                    })
                    .padding()
                  
                }
              
                .offset(y: -20)
                
                VStack(content: {
                    Text("New around here")
                    Button("Create An Account ") {
                        NavigationLink("Create An Account") {
                            RegisterView()
                        }
                    }
                })
                .padding(.bottom, 50)
                
                Spacer()
            }
          
        }
    }
}

#Preview {
    LoginView()
}
