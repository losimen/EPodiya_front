//
//  MainMenu.swift
//  EPodiya
//
//  Created by Павло Коваль on 28.05.2023.
//

import SwiftUI

struct MainMenu: View {
    @State private var showEventInfoMenu = false
    @State var isOpen: [Int: Bool] = [:]
    var body: some View {
        VStack {
            // Інші елементи вашої візуалізації
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(1..<10) { i in
                        ZStack {
                            FrontBoxView(id: 1)
                                .rotation3DEffect(.degrees(self.isOpen[i] ?? false ? 180 : 0), axis: (x:0, y:1, z:0))
                                .zIndex(self.isOpen[i] ?? false ? 0 : 1)
                            
                            BackBoxView(id: 1)
                                .rotation3DEffect(.degrees(self.isOpen[i] ?? false ? 0 : 180), axis: (x:0, y:-1, z:0))
                                .zIndex(self.isOpen[i] ?? false ? 1 : 0)
                        }
                        .gesture(TapGesture()
                            .onEnded { _ in
                                withAnimation(.spring()) {
                                    if self.isOpen[i] == nil {
                                        self.isOpen[i] = false
                                    } else {
                                        for key in isOpen.keys {
                                            isOpen[key] = false
                                        }
                                        self.isOpen[i]?.toggle()
                                    }
                                    
                                }
                            }
                        )
                    }
                }
            }
            Button(action: {
                showEventInfoMenu = true
                        }) {
                            Text("Мене зацікавила подія")
                                .font(.system(size: 19))
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
                        .padding(.top, 46.0) // Adjust the top padding as needed
        }.background(Image("MainMenu")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all))
        .sheet(isPresented: $showEventInfoMenu) {
            EventInfoMenu()
        }
        
    }
}

struct FrontBoxView: View {
    var id = 0
    var category = "Стендап"
    var shortDescription = "ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС"
    var imgUrl = "https://hws.dev/paul.jpg"
    var credo = "КРЕДО"
    
    var body: some View {
        VStack(spacing: 8) {
                    Image("image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200) // Increase the height here
                    
                    Text(category)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    
                    Text(shortDescription)
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                    
                    Text(credo)
                .font(.caption)
                .fontWeight(.black)
                .foregroundColor(Color.black)
                        
                    
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .shadow(radius: 5)
                .frame(width: 380, height: 400)
            }
    }
struct BackBoxView: View {
    var id = 0
    var category = "FFFFF"
    var description = "ПОВНИЙ ОПИС ПОВНИЙ ОПИС ПОВНИЙ ОПИС ПОВНИЙ ОПИС ПОВНИЙ ОПИС ПОВНИЙ ОПИС ПОВНИЙ ОПИС ПОВНИЙ ОПИС "
    
    var body: some View {
        VStack(spacing: 8) {
            Text(description)
                .frame(width: 320, height: 349.0)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .shadow(radius: 5)
            .frame(width: 366, height: 400)
        }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
