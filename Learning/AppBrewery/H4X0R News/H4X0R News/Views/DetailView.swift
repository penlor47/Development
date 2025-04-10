//
//  Detail.swift
//  H4X0R News
//
//  Created by Penelope Lorrimore on 08/04/2025.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url : "https://www.google.com")
}
