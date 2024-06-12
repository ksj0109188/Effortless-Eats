//
//  RecommendViewModel.swift
//  Effortless Eats
//
//  Created by 김성준 on 1/1/24.
//

import Foundation
import Combine
import UIKit

final class RecommendViewModel: ObservableObject {
    @Published var recommendedStore: Documents?
    @Published var isEmptyRecommendStore: Bool = true
    @Published var isFavorite: Bool = false
    
    struct Dependencies {
        ///notes: CoreData DB
        var repository: FoodStoreDBRepository
    }
    
    let dependency: Dependencies
    private let API = KaKaoAPI()
    private var subsciprionts = Set<AnyCancellable>()
    
    init(dependency: Dependencies) {
        self.dependency = dependency
    }
    
    func fetchRandomStore(radius mapRadius: Int) {
        recommendedStore = nil
        isEmptyRecommendStore = true
        let coordinate = API.locationManager.location?.coordinate
        
        API.requestStores(distance: mapRadius, coordinate: coordinate)
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
