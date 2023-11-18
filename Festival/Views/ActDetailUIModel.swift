//
//  ActDetailUIModel.swift
//  Festival
//
//  Created by Daniel Hallman on 11/17/23.
//

import Foundation

struct ActDetailUIModel {
    var headline: String
    var duration: String
    var location: String
    var imageUrl: URL?
    var artistInfo: String
}

public final class ActDetailUIModelMapper {
    
    private lazy var durationFormatter: DateIntervalFormatter = {
        let formatter = DateIntervalFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .short
        return formatter
    }()
    
    func toUIModel(_ act: Act) -> ActDetailUIModel {
        ActDetailUIModel(
            headline: act.headline,
            duration: durationFormatter.string(from: act.date, to: act.end),
            location: act.location.displayName,
            imageUrl: act.artistImage,
            artistInfo: act.artistInfo
        )
    }
}
