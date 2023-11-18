//
//  ActCompactUIModel.swift
//  Festival
//
//  Created by Daniel Hallman on 11/17/23.
//

import Foundation

struct ActCompactUIModel {
    var startDay: String
    var startMonth: String
    var headline: String
    var duration: String
    var location: String
    var imageUrl: URL?
}

public final class ActCompactUIModelMapper {
    
    private lazy var startDayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter
    }()
    
    private lazy var startMonthFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        return formatter
    }()
    
    private lazy var durationFormatter: DateIntervalFormatter = {
        let formatter = DateIntervalFormatter()
        formatter.dateTemplate = "EE, MMM d h:m"
        return formatter
    }()
    
    func toUIModel(_ act: Act) -> ActCompactUIModel {
        ActCompactUIModel(
            startDay: startDayFormatter.string(from: act.date),
            startMonth: startMonthFormatter.string(from: act.date),
            headline: act.headline,
            duration: durationFormatter.string(from: act.date, to: act.end),
            location: act.location.displayName,
            imageUrl: act.artistImage
        )
    }
}
