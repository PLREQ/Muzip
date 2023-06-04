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
            Rectangle().foregroundColor(.none).frame(height: 70)
            List {

                ForEach((0...5), id: \.self) { index in
                    
                    // cell
                    NavigationLink {
                        PlayListCell(url: "https://www.google.co.kr/url?sa=i&url=https%3A%2F%2Fm.dongascience.com%2Fnews.php%3Fidx%3D32697&psig=AOvVaw3oqmmRcW4w6jtklu--vnxJ&ust=1685818427911000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCIjuiJahpf8CFQAAAAAdAAAAABAE", title: "test", time: "test", artist: "test")
                        //                        nextView(index: index)
                    } label: {
                        Text("\(index)")
                    }.foregroundColor(.blue)
                    .swipeActions {
                        Button("Order") {
                            print("Awesome!")
                        }
                        .tint(.green)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                    .background(.gray)
                    .listRowSeparatorTint(.black)
                }
                        
                        //                Text("\(index)")
                
              PlayListCell(url: "https://www.google.co.kr/url?sa=i&url=https%3A%2F%2Fm.dongascience.com%2Fnews.php%3Fidx%3D32697&psig=AOvVaw3oqmmRcW4w6jtklu--vnxJ&ust=1685818427911000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCIjuiJahpf8CFQAAAAAdAAAAABAE", title: "test", time: "test", artist: "test").swipeActions {
                  
                  Button(action: {
                      
                          print("Awesome!")
                  }, label: {
//                      RoundedRectangle(cornerRadius: 10.0)
//                      .foregroundColor(.red)
                  })
                  .tint(.blue)
              }
                
                PlayListCell(url: "https://www.google.co.kr/url?sa=i&url=https%3A%2F%2Fm.dongascience.com%2Fnews.php%3Fidx%3D32697&psig=AOvVaw3oqmmRcW4w6jtklu--vnxJ&ust=1685818427911000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCIjuiJahpf8CFQAAAAAdAAAAABAE", title: "test", time: "test", artist: "test")
                    .swipeActions {
                        
                        Button(action: {
                            print("Awesome!")
                        }, label: {
                            RoundedRectangle(cornerRadius: 10.0)
                                .foregroundColor(.pink)
                        })
//
//                        Button("Order") {
//
//
//                        }
//                        .tint(.black)
                    }
            }
            .frame(width: UIScreen.main.bounds.width)
            .edgesIgnoringSafeArea(.all)
            .listStyle(.plain)
            .background(.black)
//            .scrollContentBackground(.hidden)
        }

    }
    
}

struct SearchingPlayListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchingPlayListView()
    }
}
