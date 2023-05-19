//
//  ColorExtension.swift
//  Muzip
//
//  Created by 이주화 on 2023/05/19.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
    
    static let mzBlue = Color(hex: "#5182FF")
    
    static let white = Color(hex: "FFFFFF")
    static let black = Color(hex: "000000")
    
    static let gray050 = Color(hex: "F1F1F1")
    static let gray300 = Color(hex: "A1A1A1")
    static let gray400 = Color(hex: "5182FF")
    static let gray450 = Color(hex: "68696D")
    static let gray800 = Color(hex: "31333C")
    static let gray850 = Color(hex: "27282F")
    static let gray900 = Color(hex: "17181C")
    
    static let mzLime = Color(hex: "#EBFF9C")
    static let mzPink = Color(hex: "#FF4DD4")
    static let mzMint = Color(hex: "#3AFFEA")
    static let mzPurple = Color(hex: "#DF7CFF")
    static let mzRed = Color(hex: "#E25149")
}
