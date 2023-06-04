//
//  PlayListCell.swift
//  Muzip
//
//  Created by Yeni Hwang on 2023/06/03.
//

import SwiftUI

struct PlayListCell: View {
    var url: String
    var title: String
    var time: String
    var artist: String
    
    var body: some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 10.0).foregroundColor(.red).padding([.leading,. trailing], -10)
            
            
            HStack{
                AsyncImage(url: URL(string: url)).frame(width: 90, height: 90).cornerRadius(10.0)
    //
                VStack{
                    Text(title)
                    Text(time)
                    Text(artist)
                }
            }
        }
        .padding(.top, 1)
//        .padding(.trailing, -20)
//        .padding(.leading, 60)
    }
}


