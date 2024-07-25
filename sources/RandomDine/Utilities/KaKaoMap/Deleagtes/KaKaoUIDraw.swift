//
//  KaKaoMapCoordinator.swift
//  RandomDine
//
//  Created by 김성준 on 6/30/24.
//

import Foundation
import CoreLocation
import KakaoMapsSDK

///notes: Kakaomap UI그리는 역할

protocol KaKaoDrawUIDelegate: AnyObject {
    func drawPoi(location: CLLocation, subView: KakaoMap)
}

//notes: KaKaoMap Poi담당 delegate 구현 클래스
class KaKaoUIDraw: KaKaoDrawUIDelegate {
    private var prevPoiId: String?
    
    private func createLabelLayer(_ subView: KakaoMap) {
        let manager = subView.getLabelManager()
        let layerOption = LabelLayerOptions(layerID: "PoiLayer", competitionType: .none, competitionUnit: .symbolFirst, orderType: .rank, zOrder: 0)
        if manager.getLabelLayer(layerID: "PoiLayer") == nil {
            let _ = manager.addLabelLayer(option: layerOption)
        }
    }
    
    private func createPois(longitude: Double, latitude: Double, _ subView: KakaoMap) {
        let manager = subView.getLabelManager()
        let layer = manager.getLabelLayer(layerID: "PoiLayer")
        let poiOption = PoiOptions(styleID: "PerLevelStyle")
        poiOption.rank = 0
        layer?.removePoi(poiID: "PerLevelStyle")
        
        if let prevPoiId = self.prevPoiId {
            layer?.removePoi(poiID: prevPoiId)
        }
        
        let poi1 = layer?.addPoi(option:poiOption, at: MapPoint(longitude: longitude, latitude: latitude))
        self.prevPoiId = poi1?.itemID
        
        let image =  UIImage(named: "roadview_search_ico_pin_map")
        let badge = PoiBadge(badgeID: "noti", image: image, offset: CGPoint(x: 0, y: 0), zOrder: 1)
        poi1?.addBadge(badge)
        poi1?.show()
        poi1?.showBadge(badgeID: "noti")
    }
    
    func drawPoi(location: CLLocation, subView: KakaoMap) {
        createLabelLayer(subView)
        createPois(longitude: location.coordinate.longitude, latitude: location.coordinate.latitude, subView)
    }
    
}
