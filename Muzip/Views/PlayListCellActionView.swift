//
//  CustomCell.swift
//  Muzip
//
//  Created by Yeni Hwang on 2023/06/10.
//

import SwiftUI

let cellActionButtonWidth: CGFloat = 100
let gapWidth: CGFloat = 10 /// Cell의 Content와 ActionButton 사이의 넓이 값

enum CellActionButton: Identifiable {
    // Button Type 필요에 따라 추가
    case delete
    var id: String {
        return "\(self)"
    }
}

struct PlayListCellActionView: View {
    let actionType: CellActionButton
    let cellHeight: CGFloat
    
    func getCellActionButtonView(for image: String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
            Image(systemName: image).foregroundColor(.white)
        }
        .foregroundColor(.red)
        .font(.headline)
        .frame(width: cellActionButtonWidth, height: cellHeight)
    }
    
    var body: some View {
        // Button Type
        switch actionType {
        case .delete:
            getCellActionButtonView(for: "trash.fill")
            .background(Color.clear)
        }
    }
}

extension View {
    func addButtonActions(trailingButton: [CellActionButton], onClick: @escaping (CellActionButton) -> Void) -> some View {
        self.modifier(SwipeContainerCell(trailingButton: trailingButton, onClick: onClick))
    }
}


struct SwipeContainerCell: ViewModifier  {
    
    /// Swipe Action 방향에 따른 버튼 상태
    enum VisibleButton {
        case none /// 가운데
        case right /// 오른쪽
    }
    
    @State private var offset: CGFloat = 0
    @State private var oldOffset: CGFloat = 0
    @State private var visibleButton: VisibleButton = .none
    let trailingButton: [CellActionButton]
    let minTrailingOffset: CGFloat
    let onClick: (CellActionButton) -> Void
  
    init(trailingButton: [CellActionButton], onClick: @escaping (CellActionButton) -> Void) {
        self.trailingButton = trailingButton
        minTrailingOffset = CGFloat(trailingButton.count) * (cellActionButtonWidth + gapWidth) * -1
        self.onClick = onClick
    }

    // none으로 돌아가기
    func reset() {
        visibleButton = .none
        offset = 0
        oldOffset = 0
    }

    func body(content: Content) -> some View {
        ZStack {
            content
                .contentShape(Rectangle())
                .offset(x: offset)
                .gesture(DragGesture(minimumDistance: 15, coordinateSpace: .local)
                    .onChanged({ (value) in
                        let totalSlide = value.translation.width + oldOffset
                        if  (Int(minTrailingOffset)...0 ~= Int(totalSlide)) {
                            withAnimation{
                                offset = totalSlide
                            }
                        }
                        
                        print("offset: ", offset)
                    })
                    .onEnded({ value in
                        withAnimation {
                            // TODO: offset 값 조절
                            // .right -> .none
                            if visibleButton == .right && value.translation.width > 20 {
                                reset()
                            // .none -> .right
                            } else if visibleButton == .none && offset < -20 {
                                    visibleButton = .right
                                    offset = minTrailingOffset
                                    oldOffset = offset
                            // 바로 삭제
                            } else if offset <= -90.0 {
                                // TODO: 삭제
                            } else {
                                reset()
                            }
                        }
                    })
                )
            
            GeometryReader { proxy in
                HStack(spacing: 0) {
                    Spacer()
                    HStack(spacing: 0) {
                        ForEach(trailingButton) { buttons in
                            Button(action: {
                                withAnimation {
                                    reset()
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    onClick(buttons)
                                }
                            }, label: {
                                PlayListCellActionView.init(actionType: buttons, cellHeight: proxy.size.height)
                            })
                        }
                    }.offset(x: (-1 * minTrailingOffset) + offset)
                }
            }
        }
    }
}
