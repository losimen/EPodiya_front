//
//  EventInfo.swift
//  EPodiya
//
//  Created by Romikk on 28.05.2023.
//

import SwiftUI

struct EventInfoMenu: View {
    var body: some View {
        ZStack {
            Image("EventInfoMenu")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            Button(action: {
                // Handle button tap
            }) {
                Text("Button")
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .frame(width: 294, height: 48)
                    .background(Color(#colorLiteral(red: 0.1176470588, green: 0.137254902, blue: 0.1882352941, alpha: 1)))
                    .cornerRadius(24)
            }
            .padding(.top, 190.0)
        }
    }
}

struct EventInfoMenu_Previews: PreviewProvider {
    static var previews: some View {
        EventInfoMenu()
    }
}
