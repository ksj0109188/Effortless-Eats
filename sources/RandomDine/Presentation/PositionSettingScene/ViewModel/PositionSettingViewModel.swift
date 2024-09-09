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
    private var meta: Meta?
    private var searchAPIPageCount = 1
    private var searchAPISize = 15
    
    init() {
        self.dependency = AppDIContainer.makePositionSettingViewModel()
    }
    
    func searchPlace(title: String) {
        searchAPIPageCount = 0
        api.searchPlace(title: title, size: searchAPISize)
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
                self?.meta = $0.meta
                self?.searchAPIPageCount += 1
            })
            .store(in: &subsciprionts)
    }
    
    func loadNextPage(title: String) {
        guard let meta = meta, !(meta.isEnd ?? true) else {
            return
        }
        
        api.searchPlace(title: title, page: searchAPIPageCount + 1, size: searchAPISize)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { complete in
                switch complete {
                case .finished:
                    debugPrint(complete)
                case .failure(let error):
                    debugPrint(error)
                }
            }, receiveValue: { [weak self] in
                guard let self = self else { return }
                guard let newItems = $0.documents else { return }
                
                if var currentItems = self.items {
                    currentItems.append(contentsOf: newItems)
                    self.items = currentItems
                } else {
                    self.items = newItems
                }
                self.meta = $0.meta
                self.searchAPIPageCount += 1
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
