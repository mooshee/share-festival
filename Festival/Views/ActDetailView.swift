//
//  ActDetailView.swift
//  Festival
//
//  Created by Daniel Hallman on 11/17/23.
//

import SwiftUI
import ScrollKit

struct ActDetailView: View {
    let act: ActDetailUIModel
    
    @State private var offset = CGPoint.zero
    @State private var visibleRatio = CGFloat.zero
    
    init(act: Act) {
        self.act = ActDetailUIModelMapper().toUIModel(act)
    }
  
    var body: some View {
        ScrollViewWithStickyHeader(
            header: header,
            headerHeight: (act.imageUrl != nil) ? 250 : 0,
            onScroll: handleOffset
        ) {
            content
        }
        .navigationTitle(act.headline)
        .background(.background)
    }
    
    func header() -> some View {
        AsyncImage(url: act.imageUrl) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if phase.error != nil {
                Color.red // Indicates an error.
            }
        }
        .opacity(visibleRatio)
    }
    
    func handleOffset(_ scrollOffset: CGPoint, visibleHeaderRatio: CGFloat) {
        self.offset = scrollOffset
        self.visibleRatio = max(0, visibleHeaderRatio)
    }
    
    @ViewBuilder
    var content: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(act.duration)
                .font(.caption)
                .foregroundColor(.gray)
            
            Text(act.headline)
                .font(.title)
            
            Text(act.artistInfo)
                .font(.body)
                .lineLimit(nil)
        }
        .padding(.horizontal)
        .padding(.top, 16.0)
        .background(.background)
    }
}

#Preview {
    NavigationStack {
        ActDetailView(act: .mock)
    }
}
