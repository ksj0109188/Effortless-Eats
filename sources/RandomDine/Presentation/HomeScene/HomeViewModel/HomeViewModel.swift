//
//  HomeViewModel.swift
//  RandomDine
//
//  Created by 김성준 on 6/4/24.
//

import Foundation
import Combine
import CoreData

final class HomeViewModel: ObservableObject {
    @Published var items: [RecommendedList] = []
    
    struct Dependencies {
        ///notes: CoreData DB
        let repository: FoodStoreDBRepository
        let locationManager: LocationManager
    }
    
    private var subsciprionts = Set<AnyCancellable>()
    let dependency: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependency = dependencies
    }
    
    func fetchFoodStore() {
        dependency.repository.selectFoodStore()
            .sink(receiveCompletion: { _ in},
                  receiveValue: { self.items = $0})
            .store(in: &subsciprionts)
    }
    
    func deleteFoodStore(_ offsets: IndexSet) {
        offsets.forEach {
            dependency.repository.deleteFoodStore(item: items[$0])
                .sink(receiveCompletion: { _ in
                    
                }, receiveValue: { _ in
                    
                })
                .store(in: &subsciprionts)
        }
    }
}
