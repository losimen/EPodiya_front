//
//  MainMenu.swift
//  EPodiya
//
//  Created by Павло Коваль on 28.05.2023.
//

import SwiftUI

struct Result: Decodable {
    var id: Int
    var name: String
    var short_description: String
    var credo: String
    var description: String
    var photo_url: String
    var time: String
    var city: String
    var is_approved: Bool
    var creator_id: Int
    var created_at: String
    var updated_at: String
}

struct MainMenu: View {
    @State private var results = [Result]()
    @State private var showEventInfoMenu = false
    @State var isOpen: [Int: Bool] = [:]

    init() {
        // Start loading the data when the view is initialized
        self.loadData()
    }

    var body: some View {
        // Check if the data has been loaded
        if results.isEmpty {
            // Show a loading view while the data is being loaded
            Text("Loading...")
                .foregroundColor(.white)
                .onAppear {
                    loadData()
                }
        } else {
            VStack {
                // Display your main view with loaded data
                ScrollView(.horizontal, showsIndicators: false) {
                    // Use the `results` array to create the views dynamically
                    HStack(alignment: .top, spacing: 16) {
                        ForEach(results.indices, id: \.self) { i in
                            // Use `results[i]` to pass the data to the views
                            ZStack {
                                FrontBoxView(id: i, result: results[i])
                                    .rotation3DEffect(.degrees(self.isOpen[i] ?? false ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                                    .zIndex(self.isOpen[i] ?? false ? 0 : 1)

                                BackBoxView(id: i, result: results[i])
                                    .rotation3DEffect(.degrees(self.isOpen[i] ?? false ? 0 : 180), axis: (x: 0, y: -1, z: 0))
                                    .zIndex(self.isOpen[i] ?? false ? 1 : 0)
                            }
                            .gesture(TapGesture()
                                .onEnded { _ in
                                    withAnimation(.spring()) {
                                        if self.isOpen[i] == nil {
                                            self.isOpen[i] = false
                                        } else {
                                            
                                            self.isOpen[i]?.toggle()
                                            print(i)
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
            }
            .background(Image("MainMenu")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all))
            .sheet(isPresented: $showEventInfoMenu) {
                EventInfoMenu()
            }
        }
    }

    func loadData() {
        // Perform the asynchronous data loading task
        guard let url = URL(string: "https://2d74-46-96-189-238.ngrok-free.app/api/events") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode([Result].self, from: data)
                DispatchQueue.main.async {
                    // Update the UI on the main queue
                    self.results = decodedResponse
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}


struct FrontBoxView: View {
    var id = 0
    var category = "Стендап"
    var shortDescription = "ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС ОПИС"
    var imgUrl = "https://hws.dev/paul.jpg"
    var credo = "КРЕДО"
    
    init(id: Int, result: Result)
    {
        self.id = id
        self.category = "Online"
        self.shortDescription = result.short_description
        self.imgUrl = result.photo_url
        self.credo = result.credo
    }
    
    
    var body: some View {
        VStack(spacing: 8) {
            Image("image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 210) // Increase the height here
                    
                    Text(category)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    
                    Text(shortDescription)
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .frame(height: 80)
                    
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
    
    init(id: Int, result: Result)
    {
        self.id = id
        self.category = "Online"
        self.description = result.description
    }
    
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
