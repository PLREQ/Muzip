//
//  SearchingPlayListView.swift
//  Muzip
//
//  Created by Yeni Hwang on 2023/06/03.
//

import SwiftUI
import CoreData

struct SearchingPlayListView: View {
    
    // 찾을 음악을 담는 List
    @State var recordedMusicList = [Music]()
    
    var body: some View {
        VStack{
            
            // 상단 투명 뷰
            Rectangle().foregroundColor(.clear).frame(height: 100)
            
            NavigationView {
                // SearchingPlayList
                ScrollView {
                    Button("add music"){
                        recordedMusicList.append(
                            Music(index: $recordedMusicList.count,
                                  title: "타이틀",
                                  artist: "아티스트",
                                  musicImageURL: URL(
                                    string: "https://i.ytimg.com/vi/g5JqPxmYhlo/hqdefault.jpg")!)
                        )
                    }
                    LazyVStack{
                        ForEach($recordedMusicList, id: \.self) { $music in
                            PlayListCellContent(
                                url: "url",
                                title: music.title,
                                time: "00:00",
                                artist: music.artist
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

private func fetchPlayLists() {
//    self.playListList = MuzipDataManager.shared.fetch()
}

struct SearchingPlayListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchingPlayListView()
    }
}
