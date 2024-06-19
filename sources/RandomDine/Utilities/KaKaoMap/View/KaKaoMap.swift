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
/// 초기에는 사용자 위치기반으로 지도 표출 및 마커를 그려야 겠네 -> 마커먼저 그리자
/// 선택된 장소가 없을때도 마찬가지로 loacation
/// 만약 사용자가 위치 기반을 허용 안 했다면...??
///
//TODO: 카카오 맵 기반으로 길게 탭 하면 그 위치를 기준으로 위경도 설정하기
// KaKaoMap.getPosition 사용
struct KakaoMapView: UIViewRepresentable {
    let viewModel = KaKaoMapViewModel()
    @Binding var draw: Bool
    /// UIView를 상속한 KMViewContainer를 생성한다.
    /// 뷰 생성과 함께 KMControllerDelegate를 구현한 Coordinator를 생성하고, 엔진을 생성 및 초기화한다.
    func makeUIView(context: Self.Context) -> KMViewContainer {
        SDKInitializer.InitSDK(appKey: "8600ff1ac736a28283518c6d1c9fc4c2")
        let view: KMViewContainer = KMViewContainer()
        view.sizeToFit()
        context.coordinator.createController(view)
        context.coordinator.controller?.prepareEngine()
        
        return view
    }

    
    /// Updates the presented `UIView` (and coordinator) to the latest
    /// configuration.
    /// draw가 true로 설정되면 엔진을 시작하고 렌더링을 시작한다.
    /// draw가 false로 설정되면 렌더링을 멈추고 엔진을 stop한다.
    func updateUIView(_ uiView: KMViewContainer, context: Self.Context) {
        if draw {
            context.coordinator.controller?.activateEngine()
        } else if !draw {
            context.coordinator.controller?.resetEngine()
        }
    }
    
    /// Coordinator 생성
    func makeCoordinator() -> KakaoMapCoordinator {
        return KakaoMapCoordinator(viewModel: viewModel)
    }

    /// Cleans up the presented `UIView` (and coordinator) in
    /// anticipation of their removal.
    static func dismantleUIView(_ uiView: KMViewContainer, coordinator: KakaoMapCoordinator) {
        
    }
}
