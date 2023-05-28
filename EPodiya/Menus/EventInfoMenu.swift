//
//  EventInfo.swift
//  EPodiya
//
//  Created by Romikk on 28.05.2023.
//

import SwiftUI

struct EventInfoMenu: View {
    @State private var showThanksMenu = false
    var body: some View {
        ZStack {
            Image("EventInfoMenu")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            Button(action: {
                showThanksMenu = true
            }) {
                Text("Відвідати подію")
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .frame(width: 294, height: 48)
                    .background(Color(#colorLiteral(red: 0.1176470588, green: 0.137254902, blue: 0.1882352941, alpha: 1)))
                    .cornerRadius(24)
            }
            .padding(.top, 10.0)
            Button(action: {
                // Add your button action here
            }) {
                Text("Стати волонтером події")
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

            .padding(.top, 130.0)
            
            Button(action: {
                // Add your button action here
            }) {
                Text("Задонатити 💰")
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

            .padding(.top, 300.0)
        }
        .fullScreenCover(isPresented: $showThanksMenu) {
            ThanksMenu()
        }
    }
}

struct EventInfoMenu_Previews: PreviewProvider {
    static var previews: some View {
        EventInfoMenu()
    }
}
