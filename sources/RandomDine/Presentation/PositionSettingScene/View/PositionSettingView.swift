//
//  SettingPositionView.swift
//  RandomDine
//
//  Created by 김성준 on 6/19/24.
//

import SwiftUI

struct PositionSettingView: View {
    @StateObject var viewModel: PositionSettingViewModel
    @State private var searchTitle: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: SearchPlaceView(positionSettingViewModel: viewModel)) {
                    SearchBar(text: $searchTitle) { }
                        .disabled(true)
                }
                
                MapView(draw: true)
            }
        }
    }
}

#Preview {
    NavigationStack {
        PositionSettingView(viewModel: PositionSettingViewModel(
            dependency: PositionSettingViewModel.Dependencies(
                repository: RealFoodStoreDBRepository(
                    persistentStore: CoreDataStack()
                )
            )
        ))
    }
}
