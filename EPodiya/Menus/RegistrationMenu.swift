//
//  RegistrationMenu.swift
//  EPodiya
//
//  Created by Romikk on 28.05.2023.
//

import SwiftUI


struct RegistrationMenu: View {
    @State private var showSuccessMenu = false
    
    var body: some View {
        ZStack {
            Image("RegistrationMenu")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                showSuccessMenu = true
            }) {
                Text("Авторизуватись")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .padding(0.0)
                    .frame(width: 220, height: 52)
                    .background(Color(#colorLiteral(red: 0.11764705882352941, green: 0.13725490196078433, blue: 0.18823529411764706, alpha: 1)))
                    .cornerRadius(32)
                    .padding(EdgeInsets(top: 14, leading: 38, bottom: 14, trailing: 38))
                    .overlay(
                        RoundedRectangle(cornerRadius: 32)
                            .stroke(Color.white, lineWidth: 0)
                    )
            }
            .padding(.top, 600.0)
        }
        .fullScreenCover(isPresented: $showSuccessMenu) {
            SuccessRegMenu()
        }
    }
}


struct RegistrationMenu_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationMenu()
        
    }
}
