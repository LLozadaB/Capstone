//
//  Post.swift
//  Capstone
//

import Foundation

struct Blog: Codable {
    let response: Response
}

struct Response: Codable {
    let posts: [Post]
}

struct Post: Codable {
    let summary: String
    let caption: String
    let photos: [Photo]
}

struct Photo: Codable {
     let originalSize: PhotoInfo

    enum CodingKeys: String, CodingKey {
        case originalSize = "original_size"
    }
}

struct PhotoInfo: Codable {
    let url: URL
}
