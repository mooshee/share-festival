//
//  ContentView.swift
//  Festival
//
//  Created by Daniel Hallman on 11/16/23.
//

import SwiftUI

struct LineupView: View {
    @StateObject var viewModel: LineupViewModel
    
    var body: some View {
        NavigationView {
            
            /*
             
             Possible improvement here would be to use an enum to determine the
             current state of the network request. Something like the following:
             
             enum LoadState<Model> {
                case loading
                case loaded(Model)
                case error(Error)
             }
             
             Then we could switch between a loading state, loaded, and an error view.
             I left it out for brevity.
             
             */
            
            List(viewModel.filteredActs) { act in
                NavigationLink {
                    ActDetailView(act: act)
                } label: {
                    ActCompactView(act: act)
                }
            }
            .navigationTitle("Festival Lineup")
            .listStyle(.plain)
            .task {
                await viewModel.loadData()
            }
            .refreshable {
                await viewModel.onPullToRefresh()
            }
            .searchable(text: $viewModel.query)
        }
    }
}

#Preview {
    LineupView(viewModel: .init())
}
