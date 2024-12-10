//
//  VideoRow.swift
//  APIcall
//
//  Created by Rihan dsa on 09/12/24.
//

import SwiftUI

struct VideoRow: View {
    
    var video:Video
    var body: some View {
        VStack(alignment: .leading ){
            if let url = URL(string: video.snippet?.thumbnails?.medium?.url ?? ""){
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                } placeholder: {
                    ProgressView()
                }
                
            }
            Text(video.snippet?.title ?? "")
                .bold()
        }
        .padding()
    }
}


