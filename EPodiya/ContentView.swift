//
//  ContentView.swift
//  Shared
//
//  Created by Romikk on 26.05.2023.
//

import SwiftUI

struct Response: Decodable {
    var results: [Result]
}

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

struct ContentView: View {
    @State private var results = [Result]()
    
    
    var body: some View {
        Text("Hello world!")
        
        List(results, id: \.id) {item in
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.short_description)
                
            }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://2d74-46-96-189-238.ngrok-free.app/api/events") else {
            print("Invalid url")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            print("here - 1")
            let decoder = JSONDecoder()
            if let decodedResponse = try! decoder.decode([Result].self, from: data) {
                print("here - 2 ", decodedResponse)
                results = decodedResponse
            }
            
        } catch {
            print("Invalid")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
