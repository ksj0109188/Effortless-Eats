//
//  Location.swift
//  Effortless Eats
//
//  Created by 김성준 on 1/11/24.
//

import Foundation
import CoreLocation

final class LocationManager: NSObject {
    private let locationManager = CLLocationManager()
    var location: CLLocation?
    //TODO: 설정 후 다른 앱 이용후 다시 foreground에도 이 설정이 살아 있을까???
    var kaKaoSettingLocation: CLLocation?
    
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
        case .restricted, .denied:
            manager.startUpdatingLocation()
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        default:
            break
        }
    }
}

extension LocationManager {
    func getLocation() -> CLLocation? {
        guard kaKaoSettingLocation == nil else { return  kaKaoSettingLocation }
        
        return location
    }
    
    func transToCLLocation(latitude: Double, longitude: Double) -> CLLocation {
        CLLocation(latitude: .init(latitude), longitude: .init(longitude))
    }
    
    func makeCLLocation(longtitude: String?, latitude: String?) -> CLLocation? {
        var location: CLLocation?
        
        if let longtitude = longtitude, let latitude = latitude {
            guard let x = Double(longtitude), let y = Double(latitude) else { return location }
            location = CLLocation(latitude: .init(y), longitude: .init(x))
        }
        
        return location
    }
    
    func setKaKaoLocationValue(location: CLLocation) {
        kaKaoSettingLocation = location
    }
}
