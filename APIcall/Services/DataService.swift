////
////  DataService.swift
////  APIcall
////
////  Created by Rihan dsa on 09/12/24.
////
//
//import Foundation
//
//struct DataService{
//    private  let apikey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
//    
//    func getVideo() async -> [Video]{
//        
//        guard apikey != nil else{
//            return [Video]()
//        }
//        
//        let urlstring = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLMRqhzcHGw1ZHtM5xYcZbJ8oUZ0aVTasI&maxResults=20&key=\(apikey!)"
//        let url = URL(string: urlstring)
//        
//        if let url = url{
//            let request = URLRequest(url: url)
//            
//            let session = URLSession.shared
//            
//            do{
//                let (data,_) = try await session.data(for: request)
//                let decoder = JSONDecoder()
//                let playlist = try decoder.decode(Playlist.self, from: data)
//                
//                return playlist.items
//            }
//            catch{
//                print(error)
//            }
//            
//        }
//        
//        return [Video]()
//        
//        
//    }
//}
//


import Foundation

struct DataService {
    private let apikey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func getVideo() async -> [Video] {
        // Check if the API key is available
        guard let apiKey = apikey else {
            print("API key is missing.")
            return []
        }
        
        // Construct the URL
        let urlString = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLMRqhzcHGw1Y5Cluhf7pKRNZtKaA3Q4kg&maxResults=20&key=\(apiKey)"
        
        // Ensure the URL is valid
        guard let url = URL(string: urlString) else {
            print("Invalid URL.")
            return []
        }
        
        let request = URLRequest(url: url)
        let session = URLSession.shared
        
        do {
            // Perform the network request
            let (data, response) = try await session.data(for: request)
            
            // Check the HTTP response status code
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                print("Error: HTTP request failed with status code \(httpResponse.statusCode)")
                // Optionally, print the response body for debugging
                if let responseData = String(data: data, encoding: .utf8) {
                    print("Response data: \(responseData)")
                }
                return []
            }
            
            // Decode the JSON response
            let decoder = JSONDecoder()
            let playlist = try decoder.decode(Playlist.self, from: data)
            
            return playlist.items
            
        } catch {
            // Print the error for debugging
            print("Error fetching videos: \(error.localizedDescription)")
            // Optionally, print the raw data for further inspection
//            if let responseData = String(data: data, encoding: .utf8) {
//                print("Raw response data: \(responseData)")
//            }
            return []
        }
    }
}
