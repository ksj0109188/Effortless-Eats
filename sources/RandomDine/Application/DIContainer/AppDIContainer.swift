//
//  AppDIContainer.swift
//  RandomDine
//
//  Created by 김성준 on 5/31/24.
//

import Foundation

//note: static 변수가 옳은가?
final class AppDIContainer {
    static let config = AppConfiguration()
    static let locationManager =  LocationManager()
    
    static func makeHomeViewModelDependencies() -> HomeViewModel.Dependencies {
        let persistence = CoreDataStack()
        let db = RealFoodStoreDBRepository(persistentStore: persistence)
        
        return HomeViewModel.Dependencies(repository: db)
    }
    
    static func makeRecommendViewModel() -> RecommendViewModel.Dependencies {
        let persistence = CoreDataStack()
        let db = RealFoodStoreDBRepository(persistentStore: persistence)
        let kakaoAPI = KaKaoAPI()
        
        return RecommendViewModel.Dependencies(repository: db, locationManager: locationManager, kakaoAPI: kakaoAPI)
    }
    
    static func makePositionSettingViewModel() -> PositionSettingViewModel.Dependencies {
        return PositionSettingViewModel.Dependencies(locationManager: locationManager)
    }
    
    static func makeKaKaoMapViewModel() -> KaKaoMapViewModel.Dependencies {
        return KaKaoMapViewModel.Dependencies(config: config, locationManager: locationManager)
    }
    
}
