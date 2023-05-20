//
//  BubbleShape.swift
//  Muzip
//
//  Created by 이주화 on 2023/05/19.
//

import SwiftUI

struct BubbleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let tipHeight: CGFloat = 10.0
        let tipWidth: CGFloat = 14.0
        let cornerRadius: CGFloat = 10.0
        
        let tipOrigin = CGPoint(x: rect.midX - tipWidth / 2, y: rect.maxY - tipHeight)
        let bubbleRect = rect.insetBy(dx: 0, dy: tipHeight)
        
        path.addRoundedRect(in: bubbleRect, cornerSize: CGSize(width: cornerRadius, height: cornerRadius))
        
        path.move(to: tipOrigin)
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: tipOrigin.x + tipWidth, y: tipOrigin.y))
        
        return path
    }
}
