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
