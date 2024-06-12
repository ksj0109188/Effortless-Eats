//
//  AppDIContainer.swift
//  RandomDine
//
//  Created by 김성준 on 5/31/24.
//

import Foundation

struct AppDIContainer {
    func makeHomeViewModelDependencies() -> HomeViewModel.Dependencies {
        let persistence = CoreDataStack()
        let db = RealFoodStoreDBRepository(persistentStore: persistence)
        
        return HomeViewModel.Dependencies(repository: db)
    }
}
