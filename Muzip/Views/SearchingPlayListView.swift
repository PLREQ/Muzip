//
//  SearchingPlayListView.swift
//  Muzip
//
//  Created by Yeni Hwang on 2023/06/03.
//

import SwiftUI

struct SearchingPlayListView: View {
    
    var body: some View {
        VStack{
            
            // 상단 투명 뷰
            Rectangle().foregroundColor(.clear).frame(height: 100)
            
            NavigationView {
                // SearchingPlayList
                ScrollView {
                    LazyVStack{
                        ForEach(1...10, id: \.self) { count in
                            PlayListCellContent(
                                url: "url",
                                title: "title",
                                time: "00:00",
                                artist: "artist"
                            ).addButtonActions(
                                trailingButton:  [.delete],
                                onClick: { button in
                                    print("clicked: \(button)")
                                }
                            )
                        }
                    }
                    Spacer()
                }
            }.frame(width: UIScreen.main.bounds.width)
            
            // search bar 높이
            Spacer().frame(height: 70)
        }

    }
    
}

struct SearchingPlayListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchingPlayListView()
    }
}
