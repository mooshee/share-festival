//
//  ActCompactView.swift
//  Festival
//
//  Created by Daniel Hallman on 11/17/23.
//

import SwiftUI

struct ActCompactView: View {
    let act: ActCompactUIModel
    
    init(act: Act) {
        self.act = ActCompactUIModelMapper().toUIModel(act)
    }
    
    var body: some View {
        HStack {
            VStack {
                Text(act.startDay)
                    .font(.title)
                Text(act.startMonth)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .frame(minWidth: 30)
            
            VStack(alignment: .leading) {
                Text(act.headline)
                    .font(.headline)
                
                Text(act.duration)
                    .font(.subheadline)
                
                Text(act.location)
                    .font(.subheadline)
            }
            
            Spacer()
            
            AsyncImage(url: act.imageUrl) { phase in
                phase.image?
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
            }
            .frame(maxWidth: 60)
        }
    }
}

#Preview {
    ActCompactView(act: .mock)
}
