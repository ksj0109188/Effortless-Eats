//
//  SettingPositionView.swift
//  RandomDine
//
//  Created by 김성준 on 6/19/24.
//

import SwiftUI
import CoreLocation

struct PositionSettingView: View {
    @StateObject private var viewModel: PositionSettingViewModel = PositionSettingViewModel()
    @State private var searchTitle: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: SearchPlaceView(viewModel: viewModel, searchTitle: $searchTitle)) {
                    SearchBar(text: $searchTitle) {}.disabled(true)
                }
                MapView(draw: true, selectedPlace: $viewModel.selectedPosition)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationBackButton(color: .black, type: .Cancel) {}
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.resetLocation()
                    } label: {
                        Image(systemName: "arrow.circlepath")
                            .font(.title3)
                            .bold()
                    }
                    .foregroundStyle(.primary)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationCheckButton(color: .primary, completeDismiss: true) {
                        viewModel.setCustomPosition()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        PositionSettingView()
    }
}
