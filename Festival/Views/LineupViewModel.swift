    //
//  LineupViewModel.swift
//  Festival
//
//  Created by Daniel Hallman on 11/17/23.
//

import Foundation

public final class LineupViewModel: ObservableObject {
    @Published var acts: [Act] = []
    @Published var query: String = ""
    
    private lazy var festivalService: FestivalService = {
        RealFestivalService()
    }()
    
    public var filteredActs: [Act] {
        guard !query.isEmpty else { return acts }
        return acts.filter { act in
            act.name.localizedCaseInsensitiveContains(query) ||
            act.location.displayName.localizedCaseInsensitiveContains(query)
        }
    }

    public func loadData() async {
        do {
            let acts = try await festivalService.getLineup()
            await MainActor.run {
                self.acts = acts
            }
        } catch {
            print(error)
        }
    }
    
    public func onPullToRefresh() async {
        await loadData()
    }
}
