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
        
        if uiViewController.canDraw, let location = getLocationFromSelectedPlace() ?? viewModel.getLocation() {
            uiViewController.markPosition(location: location, isMoveCamera: true)
        }
    }
    
    private func getLocationFromSelectedPlace() -> CLLocation? {
        guard let selectedPlace = selectedPlace,
              let placeX = selectedPlace.x,
              let placeY = selectedPlace.y,
              let longitude = Double(placeX),
              let latitude = Double(placeY) else {
            return nil
        }
        
        return viewModel.transToCLLocation(latitude: latitude, longitude: longitude)
    }
}
