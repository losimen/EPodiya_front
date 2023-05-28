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
                    // 1. Create a URL object
                        guard let url = URL(string: "https://2c89-46-96-189-238.ngrok-free.app/api/events") else {
                            print("Invalid URL")
                            return
                        }
                        
                        // 2. Create a URLRequest and set HTTP method to "POST"
                        var request = URLRequest(url: url)
                        request.httpMethod = "POST"
                        
                        // 3. Set request's content type and body
                        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                        
                        // Create a dictionary with the data
                        let eventData: [String: Any] = [
                            "creator_id": 2,
                            "short_description": description,
                            "credo": description,
                            "city": "Lviv",
                            "time": "2020-08-24 12:43:41",
                            "photo_url": "ggg",
                            "name": name,
                            "place": place,
                            "data": "2020-08-24 12:43:41",
                            "description": description,
                            "category": category,
                        ]
                        
                        // Convert the dictionary to JSON data
                        let jsonData = try? JSONSerialization.data(withJSONObject: eventData)
                        request.httpBody = jsonData
                        
                        // 4. Create a URLSession instance
                        let session = URLSession.shared
                        
                        // 5. Create a data task
                        let task = session.dataTask(with: request) { (data, response, error) in
                            if let error = error {
                                print("Error: \(error.localizedDescription)")
                                return
                            }
                            
                            // 6. Handle the response
                            if let httpResponse = response as? HTTPURLResponse {
                                print("Status code: \(httpResponse.statusCode)")
                                
                                if let data = data {
                                    // Handle the response data
                                    // ...
                                }
                            }
                        }
                        
                        // Start the data task
                        task.resume()
                    
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
