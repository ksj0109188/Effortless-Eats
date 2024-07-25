//
//  KaKaoMapViewModel.swift
//  RandomDine
//
//  Created by 김성준 on 6/19/24.
//

import Foundation
import CoreLocation
import Combine

final class KaKaoMapViewModel {
    struct Dependencies {
        let locationManager: LocationManager
    }
    
    let dependency: Dependencies
    
    init(dependency: Dependencies) {
        self.dependency = dependency
    }
    
    func getLocation() -> CLLocation? {
         dependency.locationManager.getLocation()
    }
    
}
