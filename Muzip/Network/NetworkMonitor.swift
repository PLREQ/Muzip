//
//  NetworkMonitor.swift
//  Muzip
//
//  Created by 이주화 on 2023/05/19.
//

import Network
import Combine

class NetworkMonitor: ObservableObject {
    private let monitor: NWPathMonitor
    private let queue = DispatchQueue(label: "NetworkMonitor")

    @Published var isConnected = false

    init() {
        monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }
}
