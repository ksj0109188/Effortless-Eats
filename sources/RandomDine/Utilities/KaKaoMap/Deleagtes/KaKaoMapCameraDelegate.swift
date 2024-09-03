//
//  KaKaoMapCameraDelegate.swift
//  RandomDine
//
//  Created by 김성준 on 7/8/24.
//

import Foundation
import KakaoMapsSDK
import CoreLocation

protocol KaKaoMapCameraDelegate: AnyObject {
    func cameraMoveTo(location: CLLocation, subView: KakaoMap)
}

class KaKaoCamera: KaKaoMapCameraDelegate {
    func cameraMoveTo(location: CLLocation, subView: KakaoMap) {
        let cameraUpdate: CameraUpdate = CameraUpdate.make(target: MapPoint(longitude: location.coordinate.longitude, latitude: location.coordinate.latitude), zoomLevel: subView.zoomLevel, mapView: subView)
        
        subView.moveCamera(cameraUpdate)
    }
    
    
}
