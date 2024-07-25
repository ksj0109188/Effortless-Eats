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
    @StateObject var viewModel: PositionSettingViewModel
    @State private var searchTitle: String = ""
    @State private var selectedPosition: Document?
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: SearchPlaceView(viewModel: viewModel, searchTitle: $searchTitle, selectedPosition: $selectedPosition)){
                    SearchBar(text: $searchTitle){}.disabled(true)
                }
                MapView(draw: true, selectedPlace: $selectedPosition, viewModel: .init(dependency: .init(locationManager: viewModel.dependency.locationManager)))
            }
            VStack {
                Button {
                    //TODO: 이렇게 변수를 외부에서 바꾸면 안되죵...
                    viewModel.dependency.locationManager.kaKaoSettingLocation = nil
                    selectedPosition = nil
                } label: {
                    Text("위치 초기화")
                }
            }
            .onDisappear(perform: {
                //TODO: 이 부분 리팩토링 필요
                if let xString = selectedPosition?.x, let yString = selectedPosition?.y {
                    guard let x = Double(xString), let y = Double(yString) else { return }
                    let location = CLLocation(latitude: .init(y), longitude: .init(x))
                    viewModel.setCustomPosition(location: location)
                }
            })
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationBackButton(color: .black) { }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}, label: {
                        Text("위치저장")
                    })
                }
            })
        }
    }
}

#Preview {
    NavigationStack {
        PositionSettingView(viewModel: PositionSettingViewModel(
            dependency: PositionSettingViewModel.Dependencies(
                repository: RealFoodStoreDBRepository(
                    persistentStore: CoreDataStack()
                ), locationManager: LocationManager()
            )
        ))
    }
}
