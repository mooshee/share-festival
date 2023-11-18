//
//  FestivalTests.swift
//  FestivalServiceTests
//
//  Created by Daniel Hallman on 11/16/23.
//

import XCTest
@testable import Festival

final class FestivalServiceTests: XCTestCase {
    
    let service: FestivalService = MockFestivalService()
    
    func testGetLineup() async throws {
        let acts = try await service.getLineup()
        XCTAssertEqual(acts.count, 3)
    }
    
    func testLineupDecoding() throws {
        let data = try getData(fromJSON: "fest_lineup")
        let decoder = Festival.festivalServiceDecoder()
        let array = try decoder.decode([[Act]].self, from: data)
        let acts = array.flatMap { $0 }
        XCTAssertEqual(acts.count, 63)
    }
}
