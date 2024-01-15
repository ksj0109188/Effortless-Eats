//
//  RecommendViewModel.swift
//  Effortless Eats
//
//  Created by 김성준 on 1/1/24.
//

import Foundation
import Combine

final class RecommendViewModel: ObservableObject {
  @Published var recommendedStore: Documents?
  let API = KaKaoAPI()
  var subsciprionts = Set<AnyCancellable>()
  
  func fetchRandomStore(radius mapRadius: Int) {
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
        self?.recommendedStore = stores.documents?.randomElement()
      })
      .store(in: &subsciprionts)
  }
}
