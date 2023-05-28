//
//  EventInfo.swift
//  EPodiya
//
//  Created by Romikk on 28.05.2023.
//

import SwiftUI

struct EventInfoMenu: View {
    @Environment(\.openURL) var openURL
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
                openURL(URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSeGVIjdwivE_GhHEoanLD3xYRQCHIbDRmkwz7v69Osy32Va8Q/viewform?usp=sf_link")!)
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
                openURL(URL(string: "https://send.monobank.ua/jar/2sjLcBXh9E?fbclid=PAAaaMuf5njEPMkmCKAOIWl07SWeYlAlz1tyn0SEeLpwz597PSR0JlFS0BsyU")!)
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
