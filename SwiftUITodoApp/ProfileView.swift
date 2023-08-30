//
//  ProfileView.swift
//  SwiftUITodoApp
//
//  Created by ipeerless on 27/08/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView {
            
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                    
                }else {
                    Text("loadaing oprofile....")
                }
                
            }
            .navigationTitle("Profile")
            
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 125, height: 125)
            .foregroundStyle(.blue)
            .clipShape(Circle())
            .padding()
        
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            HStack {
                Text("Member since 1999 ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            
        }
        TLButton(title: "Log Out", background: .red) {
            viewModel.logout()
        }
        Spacer()
    }
}

#Preview {
    ProfileView()
}
