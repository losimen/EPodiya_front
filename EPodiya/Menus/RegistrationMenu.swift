//
//  RegistrationMenu.swift
//  EPodiya
//
//  Created by Romikk on 28.05.2023.
//

import SwiftUI

struct RegistrationMenu: View {
    var body: some View {
        ZStack {
            Image("RegistrationMenu")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            Button(action: {
                // Action to perform when the button is tapped
            }) {
                Text("Авторизуватись")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .frame(width: 220, height: 52)
                    .background(Color(#colorLiteral(red: 0.11764705882352941, green: 0.13725490196078433, blue: 0.18823529411764706, alpha: 1)))
                    .cornerRadius(32)
                    .padding(EdgeInsets(top: 14, leading: 38, bottom: 14, trailing: 38))
                    .overlay(
                        RoundedRectangle(cornerRadius: 32)
                            .stroke(Color.white, lineWidth: 1)
                    )
            }
        }
    }
}

struct RegistrationMenu_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationMenu()
    }
}
