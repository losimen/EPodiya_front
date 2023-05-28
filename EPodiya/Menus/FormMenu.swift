//
//  FormMenu.swift
//  EPodiya
//
//  Created by Павло Коваль on 28.05.2023.
//

import SwiftUI

struct FormMenu: View {
    @State private var sendMenu = false
    @State var name: String = ""
        @State var place: String = ""
        @State var data: String = ""
        @State var description: String = ""
        @State var category: String = ""
    var body: some View {
        ZStack {
            Image("FormMenu")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            ZStack {
                Image("FormMenu")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                TextField("Назва події", text: $name)
                    .padding(.horizontal, 16)
                        .padding(.vertical, 5)
                        .frame(width: 342, height: 52)
                        .background(Color.white)
                        .cornerRadius(32)
                        .padding(.top, -250)
                TextField("📍 Місце проведення", text: $place)
                    .padding(.horizontal, 16)
                        .padding(.vertical, 5)
                        .frame(width: 342, height: 52)
                        .background(Color.white)
                        .cornerRadius(32)
                        .padding(.top, -180)
                TextField("📆 Дата проведення", text: $data)
                    .padding(.horizontal, 16)
                        .padding(.vertical, 5)
                        .frame(width: 342, height: 52)
                        .background(Color.white)
                        .cornerRadius(32)
                        .padding(.top, -110)
                TextField("Опис події", text: $description)
                    .padding(.horizontal, 16)
                        .padding(.vertical, 5)
                        .frame(width: 342, height: 156)
                        .background(Color.white)
                        .cornerRadius(32)
                        .padding(.top, 80)
                        
                Button(action: {
                    sendMenu = true
                    print("Name: \(name)")
                    print("Place: \(place)")
                    print("Data: \(data)")
                    print("Description: \(description)")
                    print("Category: \(category)")
                }) {
                    Text("Зареєструвати подію")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding(0.0)
                        .frame(width: 220, height: 42)
                        .background(Color(#colorLiteral(red: 0.11764705882352941, green: 0.13725490196078433, blue: 0.18823529411764706, alpha: 1)))
                        .cornerRadius(32)
                        .padding(EdgeInsets(top: 14, leading: 38, bottom: 14, trailing: 38))
                        .overlay(
                            RoundedRectangle(cornerRadius: 32)
                                .stroke(Color.white, lineWidth: 0)
                        )
                }
                .padding(.top, 463.0)
                
                TextField("🎟️ Категорія", text: $category)
                    .padding(.horizontal, 16)
                        .padding(.vertical, 5)
                        .frame(width: 342, height: 52)
                        .background(Color.white)
                        .cornerRadius(32)
                        .padding(.top, 320)
            }
            .fullScreenCover(isPresented: $sendMenu) {
                MainMenu()
            }
        }
    }
}

struct FormMenu_Previews: PreviewProvider {
    static var previews: some View {
        FormMenu()
    }
}
