//
//  ViewExtension.swift
//  Muzip
//
//  Created by 이주화 on 2023/05/19.
//

import SwiftUI

extension View {
    func scrollEnabled(_ enabled: Bool) -> some View {
        self.onAppear {
            UIScrollView.appearance().isScrollEnabled = enabled
        }
    }

    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}


// PlayList Cell에서 SwipeAction Button을 추가해주는 Extension입니다.
extension View {
    func addButtonActions(trailingButton: [CellActionButton], onClick: @escaping (CellActionButton) -> Void) -> some View {
        self.modifier(SwipeContainerCell(trailingButton: trailingButton, onClick: onClick))
    }
}
