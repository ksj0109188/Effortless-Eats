//
//  KaKaoMapViewModel.swift
//  RandomDine
//
//  Created by 김성준 on 9/2/24.
//

import Foundation
import KakaoMapsSDK
import CoreLocation

final class KaKaoMapViewModel {
    private let mapViewName = "mapview"
    private var map: KakaoMap?
    //TODO: 이부분 리팩토링 가능할거 같다, appConfig를 좀 더 세부적으로 KaKaoLocal, KaKaoMap으로 나누는건 어떨까
    struct Dependencies {
        let config: AppConfiguration
        let locationManager: LocationManager
    }
    
    let dependency: Dependencies
    
    init() {
        self.dependency = AppDIContainer.makeKaKaoMapViewModel()
        bootSDK()
    }
    
    private func bootSDK() {
        print(dependency.config.kakaoMapAPIKey)
        SDKInitializer.InitSDK(appKey: dependency.config.kakaoMapAPIKey)
    }
    
    func makeMapviewInfo() -> MapviewInfo {
        let mapviewInfo: MapviewInfo
        
        if let location =  dependency.locationManager.getLocation() {
            let defaultPosition = MapPoint(longitude: location.coordinate.longitude, latitude: location.coordinate.latitude)
            mapviewInfo = MapviewInfo(viewName: mapViewName, viewInfoName: "map", defaultPosition: defaultPosition, defaultLevel: 15)
        } else {
            mapviewInfo = MapviewInfo(viewName: mapViewName, viewInfoName: "map", defaultPosition: nil, defaultLevel: 15)
        }
        
        return mapviewInfo
    }
    
    func setMapView(from controller: KMController?) {
        map = controller?.getView(mapViewName) as? KakaoMap
    }
    
    func getMapview() throws -> KakaoMap {
        guard let map = map else { throw KaKaoErrorTypes.notFoundedMapBase }
        
        return map
    }
    
    func getLocation() -> CLLocation? {
        return dependency.locationManager.getLocation()
    }
    
    func updateLocation(tapped position: MapPoint) -> CLLocation {
        let latitude = position.wgsCoord.latitude
        let longtitude = position.wgsCoord.longitude
        
        let location = transToCLLocation(latitude: latitude, longitude: longtitude)
        setKakabasedLocation(location: location)
        
        return location
    }
    
    func transToCLLocation(latitude: Double, longitude: Double) -> CLLocation {
        dependency.locationManager.transToCLLocation(latitude: latitude, longitude: longitude)
    }
    
    private func setKakabasedLocation(location: CLLocation) {
        dependency.locationManager.setKaKaoLocationValue(location: location)
    }
    
    
    
}
