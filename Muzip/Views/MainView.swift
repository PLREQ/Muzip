//
//  MainView.swift
//  Muzip
//
//  Created by 이주화 on 2023/05/19.
//

import SwiftUI

struct MainView: View {
    @StateObject private var networkMonitor = NetworkMonitor()
    @State private var bubbleShapeText = ""
    @State private var isShowingProgressView = false
    @State private var isShowingBubbleShape = false
    
    private let text = "뮤집을 눌러 찾고 싶은 노래를 알려주세요"
    
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            if !isShowingBubbleShape && isShowingProgressView {
                CircleBeatAnimationView()
                    .padding(.bottom, 57)
            }
            ZStack {
                BubbleShape()
                    .fill(Color.mzPink)
                    .frame(height: 50)
                HStack(spacing: 0) {
                    ForEach(Array("뮤집을 눌러 찾고 싶은 노래를 알려주세요"), id: \.self) { char in
                        Text(String(char))
                            .font(.system(size: 14))
                            .foregroundColor(.gray050)
                            .opacity(isShowingBubbleShape ? 1 : 0)
                            .animation(.easeOut(duration: 0.5), value: isShowingBubbleShape)
                    }
                }
            }
            .frame(width: isShowingBubbleShape ? 270 : 0)
            .animation(.easeOut(duration: 0.5), value: isShowingProgressView)
            .padding(.bottom, 336)
            VStack {
                Image(name: .muzipLogo)
                    .resizable()
                    .frame(width: 274, height: 174)
                    .padding(.bottom, 57)
                    .onTapGesture {
                        withAnimation {
                            isShowingBubbleShape.toggle()
                        }
                    }
            }
            if !isShowingProgressView {
                VStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.gray))
                        .frame(width: 22, height: 22)
                        .padding(.top, 247)
                }
            }
            if !isShowingBubbleShape && isShowingProgressView {
                bottomSearchBar()
            }
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image(name: .menuIcon)
                            .resizable()
                            .frame(width: 50, height: 53)
                    }
                    .padding(.leading, 320)
                    Spacer()
                }
                .padding(.top, 6)
                Spacer()
            }
        }
        .onChange(of: networkMonitor.isConnected) { _ in
            withAnimation {
                isShowingProgressView.toggle()
                isShowingBubbleShape = isShowingProgressView ? true : false
            }
        }
    }
}
