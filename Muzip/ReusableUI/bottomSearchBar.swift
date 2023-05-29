//
//  bottomSearchBar.swift
//  Muzip
//
//  Created by 이주화 on 2023/05/29.
//

import SwiftUI

struct bottomSearchBar: View {
    @State private var isAnimating = false
    
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
                                Text("노래를 찾고 있어요...")
                                    .font(.system(size: 17))
                                    .foregroundColor(.gray050)
                                Spacer()
                                
                            }
                            .padding(.horizontal, 20)
                        }
                        .frame(width: 304, height: 50)
                        ZStack {
                            Circle()
                                .fill(Color.black)
                                .frame(width: 50, height: 50)
                            Text("X")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal, 12)
                }
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
