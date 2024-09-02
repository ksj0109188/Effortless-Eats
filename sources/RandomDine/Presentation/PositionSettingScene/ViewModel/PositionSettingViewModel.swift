//
//  PositionSettingViewModel.swift
//  RandomDine
//
//  Created by 김성준 on 6/16/24.
//

import Foundation
import Combine
import CoreLocation
// TODO: 둘로 나누어야 할 거 같음, items이 postionview에선 쓸모가 없음 ㅠ
final class PositionSettingViewModel: ObservableObject {
    @Published var items: [Document]?
    @Published var selectedPosition: Document?
    
    struct Dependencies {
//        let repository: FoodStoreDBRepository
        let locationManager: LocationManager
    }
    
    let dependency: Dependencies
    private let api = KaKaoAPI()
    private var subsciprionts = Set<AnyCancellable>()
    
    init() {
        self.dependency = AppDIContainer.makePositionSettingViewModel()
    }
    
    func searchPlace(title: String) {
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
    
    func setCustomPosition(location: CLLocation) {
        dependency.locationManager.kaKaoSettingLocation = location
    }
    
}
