//
//  PlayListCell.swift
//  Muzip
//
//  Created by Yeni Hwang on 2023/06/03.
//

import SwiftUI

struct PlayListCellContent: View {
    let url: String
    let title: String
    let time: String
    let artist: String
    var body: some View {
        VStack {
            ZStack{
                RoundedRectangle(cornerRadius: 10).foregroundColor(.gray900)
                HStack {
                    AsyncImage(
                        url: URL(string: "https://i.scdn.co/image/ab67616d0000b27348341e864d4b4881f56f01b4"),
                        scale: 8
                    ).cornerRadius(10, corners: .allCorners)
                        .padding(.leading, 5)
                    VStack(alignment: .leading){
                        // TODO: Font Size Extension
                        Text(title).bold().font(.subheadline)
                        Text(time).font(.subheadline)
                        Spacer().frame(height: 4)
                        Text(artist).font(.subheadline)
                    }
                    Spacer()
                }.padding([.all], 4)
            }.frame(height: 100)

        }
    }
}
