//
//  SearchingPlayListView.swift
//  Muzip
//
//  Created by Yeni Hwang on 2023/06/03.
//

import SwiftUI
import CoreData

//@available(iOS 14.0, *)
struct SearchingPlayListView: View {
    
    @AppStorage("recordedMusicList") var recordedMusicList: [Music] = []
    
    var body: some View {
        VStack{
            
            // 상단 투명 뷰
            Rectangle().foregroundColor(.clear).frame(height: 100)
            
            NavigationView {
                // SearchingPlayList
                ScrollView {
                    /// 더미 데이터 생성용 버튼입니다. Search 기능이 추가되면 지울 예정입니다.
                    Button("add music"){
                        recordedMusicList.append(
                            Music(id: UUID(),
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
                                onClick: { _ in
                                    recordedMusicList.removeAll(where: { $0.id == music.id })
                                }
                            )
                        }
                    }
                    Spacer()
                }
                // NavigationBarTitle 가리기
                .navigationBarTitle("", displayMode: .automatic)
                .navigationBarHidden(true)
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

