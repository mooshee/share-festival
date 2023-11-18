//
//  RealFestivalService.swift
//  Festival
//
//  Created by Daniel Hallman on 11/17/23.
//

import Foundation

final public class RealFestivalService: FestivalService {
    lazy var networkExecutor: NetworkExecutor = {
        RealNetworkExecutor()
    }()
    
    func getLineup() async throws -> [Act] {
        let request = Router.lineup.asURLRequest()
        let data = try await networkExecutor.fetch(for: request)
        let array = try festivalServiceDecoder().decode([[Act]].self, from: data)
        // Remove duplicates and sort by date
        let acts = Set(array.flatMap { $0 }).sorted()
        return acts
    }
    
    
}
