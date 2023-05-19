//
//  MuzipApp.swift
//  Muzip
//
//  Created by 이주화 on 2023/05/19.
//

import SwiftUI

@main
struct MuzipApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
