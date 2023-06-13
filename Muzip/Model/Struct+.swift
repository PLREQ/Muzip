//
//  Struct+.swift
//  Muzip
//
//  Created by Yeni Hwang on 2023/06/10.
//

import Foundation

struct Music: Codable, Hashable {
    var id: UUID
    var title: String
    var artist: String
    var musicImageURL: URL
}

struct MusicData {
    var title: String
    var artist: String
    var musicImage: Data
}
