//
//  TLButton.swift
//  SwiftUITodoApp
//
//  Created by ipeerless on 27/08/2023.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    var body: some View {
        Button(action: {
            action()
            
        }
               , label: {
            ZStack(content: {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundStyle(.white)
                    .bold()
            })
        })
        
    }
}

#Preview {
    TLButton(title: "Value", background: .red) {
//        Action
    }
}
