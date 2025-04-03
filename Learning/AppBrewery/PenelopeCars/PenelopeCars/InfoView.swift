//
//  InfoView.swift
//  PenelopeCars
//
//  Created by Penelope Lorrimore on 03/04/2025.
//

import SwiftUI

struct InfoView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(height: 50)
            .foregroundStyle(.white)
            .overlay(HStack{
                Image(systemName: imageName)
                    .foregroundStyle(Color(red: 0.61, green: 0.53, blue: 1.00))
                Text(text)
                    .foregroundStyle(.black)
            })
            .padding()
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "Hello", imageName: "phone")
            .previewLayout(.sizeThatFits)
    }
}
