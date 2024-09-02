//////
//////  KaKaoMap.swift
//////  RandomDine
//////
//////  Created by 김성준 on 6/13/24.
//////
////
//import SwiftUI
//import KakaoMapsSDK
//import CoreLocation
////TODO: 카카오 로컬 API 결과에 있틑 위 경도를 기반으로 카카오맵에 위치 표시
///// 만약 사용자가 위치 기반을 허용 안 했다면...??
/////
////TODO: 카카오 맵 기반으로 길게 탭 하면 그 위치를 기준으로 위경도 설정하기
//// KaKaoMap.getPosition 사용
//struct KakaoMapView: UIViewControllerRepresentable {
//    var viewModel: KaKaoMapViewModel
//    @Binding var draw: Bool
//    @Binding var selectedPlace: Document?
//    
//    func makeUIViewController(context: Context) -> KaKaoMapViewController {
//        return KaKaoMapViewController(viewModel: viewModel, poiDelegate: KaKaoUIDraw(), cameraDelegate: KaKaoCamera())
//    }
//    
//    func updateUIViewController(_ uiViewController: KaKaoMapViewController, context: Context) {
////        if draw {
////            uiViewController.activateEngine()
////        } else if !draw {
////            uiViewController.resetEngine()
////        }
//        
//        if let selectedPlace = selectedPlace,  let longtitude = selectedPlace.x, let latitude = selectedPlace.y {
//            if uiViewController.canDraw, let longtitude = Double(longtitude), let latitude = Double(latitude) {
////                let location = viewModel.dependency.locationManager.transToCLLocation(latitude: latitude, longitude: longtitude)
////                uiViewController.markPosition(location: location, subView: <#T##KakaoMap#>, isMoveCamera: true)
//            }
//        }
//    }
//}
//
////struct KakaoMapView: UIViewRepresentable {
////        let viewModel: KaKaoMapViewModel
////        @Binding var draw: Bool
////        @Binding var selectedPlace: Document?
////    /// UIView를 상속한 KMViewContainer를 생성한다.
////    /// 뷰 생성과 함께 KMControllerDelegate를 구현한 Coordinator를 생성하고, 엔진을 생성 및 초기화한다.
////    func makeUIView(context: Self.Context) -> KMViewContainer {
////        SDKInitializer.InitSDK(appKey: "8600ff1ac736a28283518c6d1c9fc4c2")
////        let view: KMViewContainer = KMViewContainer()
////
////        context.coordinator.createController(view)
////        context.coordinator.controller?.prepareEngine()
////       
////        return view
////    }
////
////    /// Updates the presented `UIView` (and coordinator) to the latest
////    /// configuration.
////    /// draw가 true로 설정되면 엔진을 시작하고 렌더링을 시작한다.
////    /// draw가 false로 설정되면 렌더링을 멈추고 엔진을 stop한다.
////    func updateUIView(_ uiView: KMViewContainer, context: Self.Context) {
////        if draw {
////            context.coordinator.controller?.activateEngine()
////        } else if !draw {
////            context.coordinator.controller?.resetEngine()
////        }
////        
////        // 이 부분 locationMaanager에서 실행하자
////        //TODO: 이 부분 리팩토링 필요
////        if context.coordinator.canDraw {
////            if let xString = selectedPlace?.x, let yString = selectedPlace?.y {
////                guard let x = Double(xString), let y = Double(yString) else { return }
////                let location = CLLocation(latitude: .init(y), longitude: .init(x))
////                context.coordinator.drawPoi(location: location)
////            } else {
////                context.coordinator.drawPoi(location: viewModel.getLocation())
////            }
////        }
////    }
////    
////    /// Coordinator 생성
////    func makeCoordinator() -> KakaoMapCoordinatorTest {
////        return KakaoMapCoordinatorTest(viewModel: viewModel)
////    }
////
////    /// Cleans up the presented `UIView` (and coordinator) in
////    /// anticipation of their removal.
////    static func dismantleUIView(_ uiView: KaKaoMapViewController, coordinator: KakaoMapCoordinatorTest) {
////        
////    }
////}
