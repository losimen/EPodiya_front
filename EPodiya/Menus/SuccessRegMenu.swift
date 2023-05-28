//
//  SuccessRegMenu.swift
//  EPodiya
//
//  Created by Romikk on 28.05.2023.
//

import SwiftUI

struct SuccessRegMenu: View {
    var body: some View {
        ZStack {
            Image("SuccessRegMenu")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            Button(action: {
                // Add your button action here
            }) {
                Text("Перейти до подій")
                    .foregroundColor(.black)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .frame(width: 300, height: 50)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 32)
                            .stroke(Color(red: 30/255, green: 35/255, blue: 48/255), lineWidth: 2)
                    )
                    .padding(EdgeInsets(top: 14, leading: 38, bottom: 14, trailing: 38))
            }

            .padding(.top, 190.0)
        }
    }
}

struct SuccessRegMenu_Previews: PreviewProvider {
    static var previews: some View {
        SuccessRegMenu()
    }
}
