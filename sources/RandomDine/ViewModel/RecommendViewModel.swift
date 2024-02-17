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

    let API = KaKaoAPI()
    var subsciprionts = Set<AnyCancellable>()
    
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
}
