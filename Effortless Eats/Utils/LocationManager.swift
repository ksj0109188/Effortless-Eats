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
        debugPrint(location.coordinate.latitude)
        debugPrint(location.coordinate.longitude)
        self.location = location
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        debugPrint("locationManager error", error)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
            case .authorizedWhenInUse:  // Location services are available.
                manager.startUpdatingLocation()
                break
            case .restricted, .denied:  // Location services currently unavailable.
                manager.startUpdatingLocation()
                break
            case .notDetermined:        // Authorization not determined yet.
                print("notYet")
                manager.requestWhenInUseAuthorization()
                break
            default:
                break
        }
    }
}
