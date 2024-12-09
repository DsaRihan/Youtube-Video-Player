//
//  Video.swift
//  APIcall
//
//  Created by Rihan dsa on 09/12/24.
//
import Foundation

struct Video: Decodable, Identifiable{
    var id:String
    var snippet:Snippet?
}

struct Snippet:Decodable{
    var title:String
    var description:String
    var thumbnails:Thumbnails?
    var resourceId:ResourseId?
}

struct ResourseId:Decodable{
    var videoId:String
}

struct Thumbnails:Decodable{
    var medium:ThumbnailSize?
}

struct ThumbnailSize:Decodable{
    var url:String
    var width:Int
    var height:Int
}
