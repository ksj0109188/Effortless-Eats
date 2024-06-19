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
    private let locationManager = LocationManager()
    private var subsciprionts = Set<AnyCancellable>()
    
    func getLocation() -> CLLocation? {
        return locationManager.location
    }
    
}
