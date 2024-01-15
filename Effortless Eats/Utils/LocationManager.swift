//
//  Location.swift
//  Effortless Eats
//
//  Created by 김성준 on 1/11/24.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    @Published var location: CLLocation?

    override init() {
        super.init()
        self.locationManager.delegate = self
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        debugPrint("locationManager error", error)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
            case .authorizedWhenInUse:
                manager.startUpdatingLocation()
                break
            case .restricted, .denied:
                manager.startUpdatingLocation()
                break
            case .notDetermined:
                manager.requestWhenInUseAuthorization()
                break
            default:
                break
        }
    }
}
