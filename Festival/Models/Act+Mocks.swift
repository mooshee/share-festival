//
//  Act+Mocks.swift
//  Festival
//
//  Created by Daniel Hallman on 11/17/23.
//

import Foundation

extension Act {
    static let mock: Act = .init(
        id: 1, 
        name: "Eric Prydz",
        summary: "Presents: HOLO",
        location: .pierStage,
        date: Date(),
        end: Calendar.current.date(byAdding: .hour, value: 2, to: Date())!,
        tags: [],
        artistIds: [6],
        artistImage: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Eric_Prydz_at_Glastonbury_2009.jpg/440px-Eric_Prydz_at_Glastonbury_2009.jpg")!,
        artistInfo: "Eric Prydz: Eric Prydz is a Swedish DJ and producer revered for his progressive house tracks and pioneering visual shows, like HOLO."
    )
    
    static let mock2: Act = .init(
        id: 2,
        name: "Tokischa",
        summary: "",
        location: .craneStage,
        date: Calendar.current.date(byAdding: .hour, value: -2, to: Date())!,
        end: Calendar.current.date(byAdding: .hour, value: 4, to: Date())!,
        tags: [],
        artistIds: [1107],
        artistImage: nil,
        artistInfo: "Tokischa's raw and unapologetic reggaeton style adds a powerful punch to the crane_stage lineup."
    )
    
    static let mock3: Act = .init(
        id: 3,
        name: "Dummy",
        summary: "Live",
        location: .warehouse,
        date: Date(),
        end: Calendar.current.date(byAdding: .hour, value: 2, to: Date())!,
        tags: [],
        artistIds: [324],
        artistImage: nil,
        artistInfo: "A dummy artist"
    )
}
