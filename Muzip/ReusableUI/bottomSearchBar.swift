//
//  bottomSearchBar.swift
//  Muzip
//
//  Created by 이주화 on 2023/05/29.
//

import SwiftUI

struct bottomSearchBar: View {
    @State private var isAnimating = false
    @State private var isSearch = true
    @State private var showingSaveAlert = false
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Color.gray850
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 50)
                                .fill(Color.black)
                            HStack {
                                Text(isSearch ? "노래를 찾고 있어요..." : "잠시 멈춤")
                                    .font(.system(size: 17))
                                    .foregroundColor(.gray050)
                                Spacer()
                                Button(action: {
                                    isSearch.toggle()
                                }) {
                                    if isSearch {
                                        WaveAnimaionView(color: Color.mzLime, renderingMode: .palette, secondaryColor: Color.black)
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                    } else {
                                        Image(name: .pause)
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                    }
                                }
                            }
                            .padding(.leading, 20)
                        }
                        .frame(width: 304, height: 50)
                        ZStack {
                            Circle()
                                .fill(Color.black)
                                .frame(width: 50, height: 50)
                            
                            Button(action: {
                                showingSaveAlert.toggle()
                            }, label: {
                                Text("X")
                                    .font(.system(size: 25, weight: .bold))
                                    .foregroundColor(.white)
                            })
                            .alert("음악 탐색 종료하기", isPresented: $showingSaveAlert) {
                                Button("저장하기",action: {}).keyboardShortcut(.defaultAction)
                                Button("취소하기", role: .cancel, action: {})
                                Button("저장하지 않고 나가기", role: .destructive, action: {})
                            } message: {
                                Text("음악 탐색을 종료합니다.\n탐색한 음악을 플레이리스트로 저장할까요?")
                            }
                        }
                    }
                    .padding(.horizontal, 12)
                }
                .padding(.bottom, 1)
            }
            .frame(height: isAnimating ? 66 : 0)
            .animation(
                .easeInOut(duration: 0.2)
                .delay(0.1)
                , value: isAnimating
            )
        }
        .onAppear {
            self.isAnimating = true
        }
    }
}

struct bottomSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        bottomSearchBar()
    }
}
