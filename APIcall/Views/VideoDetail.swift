//
//  VideoDetail.swift
//  APIcall
//
//  Created by Rihan dsa on 09/12/24.
//

import SwiftUI
import YouTubePlayerKit
import YouTubePlayerKit_YouTubePlayerKit

struct VideoDetail: View {
    var video:Video
    var body: some View {
        VStack (alignment: .leading){
            
            let youTubePlayer = YouTubePlayer(
                source: .video(id: video.snippet?.resourceId?.videoId),
                configuration: .init(
                    autoPlay: true
                )
            )
            YouTubePlayerView(
                youTubePlayer
            )
            
            ScrollView{
                VStack(alignment: .leading, spacing: 30){
                    Text(video.snippet?.title ?? "")
                        .font(.headline)
                        .bold()
                    
                    Text(video.snippet?.description ?? "")
                }
            }
        }
        .padding()
        .scrollIndicators(.hidden)
    }
}


