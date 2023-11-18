//
//  FestivalService.swift
//  Festival
//
//  Created by Daniel Hallman on 11/17/23.
//

import Foundation

protocol FestivalService {
    var networkExecutor: NetworkExecutor { get }
    
    func getLineup() async throws -> [Act]
}

final public class MockFestivalService: FestivalService {
    lazy var networkExecutor: NetworkExecutor = {
        MockNetworkExecutor()
    }()
    
    func getLineup() async throws -> [Act] {
        [
            .mock,
            .mock2,
            .mock3
        ]
    }
}

func festivalServiceDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
    decoder.dateDecodingStrategy = .formatted(dateFormatter)
    
    return decoder
}
