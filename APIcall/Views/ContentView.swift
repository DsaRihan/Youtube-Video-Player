//
//  ContentView.swift
//  APIcall
//
//  Created by Rihan dsa on 09/12/24.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        VStack {
            FeedView()
                .tabItem{
                    Image(systemName: "play.square.stack")
                    Text("Feed")
                }
        }
        .padding()
        
    }
}

#Preview {
    HomePage()
}
