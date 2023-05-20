//
//  ImageExtension.swift
//  Muzip
//
//  Created by 이주화 on 2023/05/19.
//

import SwiftUI

extension Image {
    enum ImageName: String {
        case muzipLogo = "MuzipLogo"
        
    }
    
    init(name imageName: ImageName) {
        self.init(imageName.rawValue)
    }
}

