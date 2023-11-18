//
//  NetworkExecutor.swift
//  Festival
//
//  Created by Daniel Hallman on 11/17/23.
//

import Foundation

protocol NetworkExecutor {
    func fetch(for request: URLRequest) async throws -> Data
}

final public class MockNetworkExecutor: NetworkExecutor {
    var response: Response = .success(Data())
    
    public enum Response {
      case success(Data)
      case error(Error)
    }
    
    func fetch(for request: URLRequest) async throws -> Data {
        switch response {
        case .success(let data): return data
        case .error(let error): throw error
        }
    }
}
