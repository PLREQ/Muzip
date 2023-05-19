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

