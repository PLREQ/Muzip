//
//  ArrayExtension.swift
//  Muzip
//
//  Created by 이주화 on 2023/05/19.
//

import Foundation

extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
