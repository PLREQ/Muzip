//
//  CircleBeatAnimationView.swift
//  Muzip
//
//  Created by 이주화 on 2023/05/29.
//

import SwiftUI

struct CircleBeatAnimationView: View {
    @State private var isAnimating = false
    @State private var animationSpeed: Double = 1
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color.mzBlue)
                    .opacity(0.2)
                    .frame(width: 518, height: 518)
                    .scaleEffect(isAnimating ? 1.1 : 1.0)
                    .animation(
                        .easeInOut(duration: 0.2)
                        .repeatForever(autoreverses: true)
                        .speed(animationSpeed)
                        , value: isAnimating
                    )
                Circle()
                    .fill(Color.mzBlue)
                    .opacity(0.2)
                    .frame(width: 354, height: 354)
                    .scaleEffect(isAnimating ? 1.1 : 1.0)
                    .animation(
                        .easeInOut(duration: 0.2)
                        .repeatForever(autoreverses: true)
                        .speed(animationSpeed)
                        .delay(0.05)
                        , value: isAnimating
                    )
                
                Circle()
                    .fill(Color.black)
                    .frame(width: 218, height: 218)
                    .scaleEffect(isAnimating ? 1.1 : 1.0)
                    .animation(
                        .easeInOut(duration: 0.2)
                        .repeatForever(autoreverses: true)
                        .speed(animationSpeed)
                        .delay(0.1)
                        , value: isAnimating
                    )
            }
        }
        .onAppear {
            self.isAnimating = true
        }
    }
}
