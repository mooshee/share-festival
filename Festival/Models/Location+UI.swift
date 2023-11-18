//
//  Location+UI.swift
//  Festival
//
//  Created by Daniel Hallman on 11/17/23.
//

import Foundation

extension Location {
    public var displayName: String {
        switch self {
        case .craneStage: return "Crane Stage"
        case .pierStage: return "Pier Stage"
        case .shipTent: return "Ship Tent"
        case .warehouse: return "Warehouse"
        }
    }
}
