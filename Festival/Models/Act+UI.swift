//
//  Act+UI.swift
//  Festival
//
//  Created by Daniel Hallman on 11/17/23.
//

import Foundation

extension Act: Comparable {
    public static func == (lhs: Act, rhs: Act) -> Bool {
        lhs.id == rhs.id
    }
    
    public static func < (lhs: Act, rhs: Act) -> Bool {
        if lhs.date != rhs.date {
            return lhs.date < rhs.date
        } else {
            return lhs.end < rhs.end
        }
    }
}

extension Act {
    var headline: String {
        [name, summary]
            .compactMap { $0 }
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
}
