//
//  ThanksMenu.swift
//  EPodiya
//
//  Created by Павло Коваль on 28.05.2023.
//

import SwiftUI

struct ThanksMenu: View {
    @State private var showMenuMenu = false
    
    var body: some View {
        ZStack {
            Image("ThanksMenu")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            Button(action: {
                showMenuMenu = true
            }) {
                Text("Клас")
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

            .padding(.top, 70.0)
            
        }
        .fullScreenCover(isPresented: $showMenuMenu) {
            MainMenu()
        }
    }
}

struct ThanksMenu_Previews: PreviewProvider {
    static var previews: some View {
        ThanksMenu()
    }
}
