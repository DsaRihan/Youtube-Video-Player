//
//  FeedView.swift
//  APIcall
//
//  Created by Rihan dsa on 09/12/24.
//

import SwiftUI

struct FeedView: View {
    
    @State private var videos = [Video]()
    @State private var selectedvid : Video?
    var body: some View {
        List(videos){
            v in
            VideoRow(video: v)
                .onTapGesture {
                    selectedvid = v
                }
                .listRowSeparator(.hidden)
        }
            .listStyle(.plain)
            .scrollIndicators(.hidden)
            .task {
                 self.videos  = await DataService().getVideo()
                
            }
            .sheet(item: $selectedvid){
                v in
                VideoDetail(video: v)
            }
    }
}

#Preview {
    FeedView()
}
