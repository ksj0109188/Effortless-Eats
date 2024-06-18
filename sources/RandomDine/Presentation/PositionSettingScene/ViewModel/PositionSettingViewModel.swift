//
//  PositionSettingViewModel.swift
//  RandomDine
//
//  Created by 김성준 on 6/16/24.
//

import Foundation
import Combine

final class PositionSettingViewModel: ObservableObject {
    @Published var items: [Document]?
    
    struct Dependencies {
        var repository: FoodStoreDBRepository
    }
    
    private let dependency: Dependencies
    private let api = KaKaoAPI()
    private var subsciprionts = Set<AnyCancellable>()
    
    init(dependency: Dependencies) {
        self.dependency = dependency
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
                debugPrint($0)
                self?.items = $0.documents
            })
            .store(in: &subsciprionts)
    }
}
