//
//  SettingPositionView.swift
//  RandomDine
//
//  Created by 김성준 on 6/19/24.
//

import SwiftUI
import CoreLocation

struct PositionSettingView: View {
    //TODO: selectedPosition, viewModel locationManager 위/경도 값 두개가 지금 뷰끼리 흐름있음, 이걸 고민해서 고쳐야함
    @StateObject private var viewModel: PositionSettingViewModel = PositionSettingViewModel()
    @State private var searchTitle: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: SearchPlaceView(viewModel: viewModel, searchTitle: $searchTitle)){
                    SearchBar(text: $searchTitle){}.disabled(true)
                }
//                MapView(draw: true, selectedPlace: $selectedPosition, viewModel: .init(dependency: .init(locationManager: viewModel.dependency.locationManager)))
                MapView(draw: true, selectedPlace: $viewModel.selectedPosition)
            }
            VStack {
                Button {
                    viewModel.resetLocation()
                } label: {
                    Text("위치 초기화")
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationBackButton(color: .black) { }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        viewModel.setCustomPosition()
                    }, label: {
                        Text("위치저장")
                    })
                }
            })
        }
    }
}

#Preview {
    NavigationStack {
        PositionSettingView()
    }
}
