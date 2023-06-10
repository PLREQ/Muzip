//
//  Struct+.swift
//  Muzip
//
//  Created by Yeni Hwang on 2023/06/10.
//

import Foundation

struct Music: Codable, Hashable {
    // MARK: 임시 ID
    var index: Int
    var title: String
    var artist: String
    var musicImageURL: URL
}

struct MusicData {
    var title: String
    var artist: String
    var musicImage: Data
}
