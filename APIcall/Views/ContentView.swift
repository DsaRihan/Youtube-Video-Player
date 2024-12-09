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
        }
        .padding()
        .onAppear(perform: {
            if let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String {
                print("API Key: \(apiKey)")
            } else {
                print("Could not find API_KEY")
            }
        })
    }
}

#Preview {
    HomePage()
}
