//
//  HeaderView.swift
//  SwiftUITodoApp
//
//  Created by ipeerless on 27/08/2023.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subTitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(background)
                .rotationEffect(Angle(degrees: angle))
             
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
                Text(subTitle)
                    .font(.system(size: 32))
                    .foregroundStyle(.white)
            }
            .padding(.top, 80)
        }
      
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -150)
        
    }
}

#Preview {
    HeaderView(title: "Title", subTitle: "SubTitle", angle: 15, background: .blue)
}
