//
//  AppDIContainer.swift
//  RandomDine
//
//  Created by 김성준 on 5/31/24.
//

import Foundation

struct AppDIContainer {
    static func makeHomeViewModelDependencies() -> HomeViewModel.Dependencies {
        let persistence = CoreDataStack()
        let db = RealFoodStoreDBRepository(persistentStore: persistence)
        let locationManager = LocationManager()
        
        return HomeViewModel.Dependencies(repository: db, locationManager: locationManager)
    }
}
