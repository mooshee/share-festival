//
//  RealNetworkExecutor.swift
//  Festival
//
//  Created by Daniel Hallman on 11/17/23.
//

import Foundation

final public class RealNetworkExecutor: NetworkExecutor {
    private let urlSession: URLSession
    
    init() {
        self.urlSession = URLSession.shared
    }
    
    func fetch(for request: URLRequest) async throws -> Data {
        let (data, _) = try await urlSession.data(for: request)
        return data
    }
    
}
