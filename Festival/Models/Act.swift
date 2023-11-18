//
//  Act.swift
//  Festival
//
//  Created by Daniel Hallman on 11/17/23.
//

import Foundation

public struct Act: Identifiable, Hashable, Codable {
    public var id: Int
    public var name: String
    public var summary: String
    public var location: Location
    public var date: Date
    public var end: Date
    public var tags: [String]
    public var artistIds: [Int]
    public var artistImage: URL?
    public var artistInfo: String
}


