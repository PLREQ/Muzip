//
//  MainView.swift
//  Muzip
//
//  Created by 이주화 on 2023/05/19.
//

import SwiftUI

struct MainView: View {
    @StateObject private var networkMonitor = NetworkMonitor()
    @State private var isShowingProgressView = true
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Spacer().frame(height: networkMonitor.isConnected ? 188 : 263)
                if networkMonitor.isConnected {
                    ZStack {
                        BubbleShape()
                            .fill(Color.mzPink)
                            .frame(height: 43)
                        Text("뮤집을 눌러 찾고 싶은 노래를 알려주세요")
                            .font(.system(size: 14))
                            .foregroundColor(.gray050)
                            .padding()
                    }
                    .padding(.horizontal, 60)
                    .padding(.bottom, 18)
                }
                Image(name: .muzipLogo)
                    .resizable()
                    .frame(width: 274, height: 174)
                if !networkMonitor.isConnected {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.gray))
                        .frame(width: 22, height: 22)
                        .padding(.top, 54)
                }
                Spacer()
            }
        }
    }
}
