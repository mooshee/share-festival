//
//  FestivalApp.swift
//  Festival
//
//  Created by Daniel Hallman on 11/16/23.
//

import SwiftUI

@main
struct FestivalApp: App {
    var body: some Scene {
        WindowGroup {
            LineupView(viewModel: .init())
        }
    }
}
