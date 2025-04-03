//
//  ContentView.swift
//  PenelopeCars
//
//  Created by Penelope Lorrimore on 03/04/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(UIColor(red: 0.61, green: 0.53, blue: 1.00, alpha: 1.00))
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("penny")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                Text("Penelope Alice")
                    .font(Font.custom("BilboHandFine 2", size: 40))
                    .bold()
                    .foregroundStyle(.white)
                Text("software engineer")
                    .foregroundStyle(.white)
                    .font(.system(size: 25))
                Divider()
                InfoView(text: "+44 1234 567891", imageName: "phone.fill")
                InfoView(text: "123@email.com", imageName: "envelope.fill")
            }
        }
    }
}

#Preview {
    ContentView()
}

