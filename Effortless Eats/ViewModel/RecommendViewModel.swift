//
//  RecommendViewModel.swift
//  Effortless Eats
//
//  Created by 김성준 on 1/1/24.
//

import Foundation
import Combine

final class RecommendViewModel: ObservableObject {
    @Published var recommendedStore: [Documents]?
    @Published var isEmptyRecommendStore: Bool = true

    let API = KaKaoAPI()
    var subsciprionts = Set<AnyCancellable>()
    
    func fetchRandomStore(radius mapRadius: Int) {
        isEmptyRecommendStore = true
        
        API.requestStores(mapRadius)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { complete in
                switch complete {
                    case .finished:
                        debugPrint(complete)
                    case .failure(let error):
                        debugPrint(error)
                }
            },receiveValue: {[weak self] stores in
                let store = stores.documents
                self?.recommendedStore = store
                self?.isEmptyRecommendStore = false
            })
            .store(in: &subsciprionts)
    }
}
