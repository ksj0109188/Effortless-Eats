////
////  KaKaoMap.swift
////  RandomDine
////
////  Created by 김성준 on 6/13/24.
////
//
import SwiftUI
import KakaoMapsSDK
import CoreLocation
//TODO: 카카오 로컬 API 결과에 있틑 위 경도를 기반으로 카카오맵에 위치 표시
/// 만약 사용자가 위치 기반을 허용 안 했다면...??
///
//TODO: 카카오 맵 기반으로 길게 탭 하면 그 위치를 기준으로 위경도 설정하기
// KaKaoMap.getPosition 사용
struct KakaoMapView: UIViewControllerRepresentable {
    var viewModel: KaKaoMapViewModel
    @Binding var draw: Bool
    @Binding var selectedPlace: Document?
    
    func makeUIViewController(context: Context) -> KaKaoMapViewController {
        return KaKaoMapViewController()
    }
    
    func updateUIViewController(_ uiViewController: KaKaoMapViewController, context: Context) {
        if draw {
            uiViewController.activateEngine()
        } else if !draw {
            uiViewController.resetEngine()
        }
        
        if let selectedPlace = selectedPlace,  let longtitude = selectedPlace.x, let latitude = selectedPlace.y {
            if uiViewController.canDraw, let longtitude = Double(longtitude), let latitude = Double(latitude) {
                let location = viewModel.transToCLLocation(latitude: latitude, longitude: longtitude)
                uiViewController.markPosition(location: location, isMoveCamera: true)
            }
        }
    }
}
