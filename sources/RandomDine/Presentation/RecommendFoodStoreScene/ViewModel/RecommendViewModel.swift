//
//  RecommendViewModel.swift
//  Effortless Eats
//
//  Created by 김성준 on 1/1/24.
//

import Foundation
import Combine
import UIKit
import CoreLocation

final class RecommendViewModel: ObservableObject {
    @Published var recommendedStore: Document?
    @Published var isEmptyRecommendStore: Bool = true
    @Published var isFavorite: Bool = false
    
    struct Dependencies {
        let repository: FoodStoreDBRepository
        let locationManager: LocationManager
    }
    
    let dependency: Dependencies
    private let api = KaKaoAPI()
    private var subsciprionts = Set<AnyCancellable>()
    
    init(dependency: Dependencies) {
        self.dependency = dependency
    }
    
    func fetchRandomStore(radius mapRadius: Int) {
        recommendedStore = nil
        isEmptyRecommendStore = true
        // Map에서 설정된 위치가 있다면, LocationManager말고 설정된 카카오 위 경도 값으로 위치를 조회한다.
        let coordinate: CLLocationCoordinate2D?
        if let location = dependency.locationManager.kaKaoSettingLocation {
            print(location)
            coordinate = location.coordinate
        } else {
            coordinate = api.locationManager.location?.coordinate
        }
        
        api.requestStores(distance: mapRadius, coordinate: coordinate)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { complete in
                switch complete {
                case .finished:
                    debugPrint(complete)
                case .failure(let error):
                    debugPrint(error)
                }
            }, receiveValue: {[weak self] stores in
                let store = stores.documents
                self?.recommendedStore = store?.randomElement()
                if self?.recommendedStore != nil {
                    self?.isEmptyRecommendStore = false
                }
            })
            .store(in: &subsciprionts)
    }
    
    func addFavorite() {
        guard let data = recommendedStore else { return }
        
        dependency.repository.insertFoodStore(foodStore: data)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isFavorite = true
                case .failure:
                    break
                }
            }, receiveValue: {})
            .store(in: &subsciprionts)
    }
    
    func cancelFavorite() {
        guard let id = recommendedStore?.id else { return }
        
        dependency.repository.cancelFavoriteFoodStore(id: id)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isFavorite = false
                case .failure:
                    break
                }
            }, receiveValue: {})
            .store(in: &subsciprionts)
    }
    
    func checkFavorite() {
        guard let id = recommendedStore?.id else { return }
        
        dependency.repository.countFoodStore(id: id)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] in
                self?.isFavorite = $0 > 0 ? true : false
            })
            .store(in: &subsciprionts)
    }
}
