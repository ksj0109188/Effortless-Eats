//
//  PositionSettingViewModel.swift
//  RandomDine
//
//  Created by 김성준 on 6/16/24.
//

import Foundation
import Combine
import CoreLocation

final class PositionSettingViewModel: ObservableObject {
    @Published var items: [Document]?
    @Published var selectedPosition: Document?
    
    struct Dependencies {
        let locationManager: LocationManager
    }
    
    let dependency: Dependencies
    private let api = KaKaoAPI()
    private var subsciprionts = Set<AnyCancellable>()
    
    init() {
        self.dependency = AppDIContainer.makePositionSettingViewModel()
    }
    
    func searchPlace(title: String) {
        //TODO: Page, size설정해서 paging 기능 구현하자
        api.searchPlace(title: title)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { complete in
                switch complete {
                case .finished:
                    debugPrint(complete)
                case .failure(let error):
                    debugPrint(error)
                }
            }, receiveValue: { [weak self] in
                self?.items = $0.documents
            })
            .store(in: &subsciprionts)
    }
    
    func setCustomPosition() {
        if let xString = selectedPosition?.x, let yString = selectedPosition?.y {
            guard let x = Double(xString), let y = Double(yString) else { return }
            let location = CLLocation(latitude: .init(y), longitude: .init(x))
            dependency.locationManager.kaKaoSettingLocation = location
        }
    }
    
    func setCurrentSelect(selectedPlace: Document) {
        selectedPosition = selectedPlace
    }
    
    func resetLocation() {
        dependency.locationManager.kaKaoSettingLocation = nil
        selectedPosition = nil
    }
}
