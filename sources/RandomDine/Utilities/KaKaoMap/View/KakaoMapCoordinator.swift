//
//  KaKaoMapCoordinator.swift
//  RandomDine
//
//  Created by 김성준 on 6/18/24.
//

import Foundation
import KakaoMapsSDK
import CoreLocation
import Combine

/// Coordinator 구현. KMControllerDelegate를 adopt한다.
class KakaoMapCoordinator: UIViewController, MapControllerDelegate {
    private let viewModel: KaKaoMapViewModel!
    
    var controller: KMController?
    var first: Bool = true
    
    init(viewModel: KaKaoMapViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // KMController 객체 생성 및 event delegate 지정
    func createController(_ view: KMViewContainer) {
        controller = KMController(viewContainer: view)
        controller?.delegate = self
    }
    
    func authenticationSucceeded() {
        print("성공")
    }
    
    func authenticationFailed(_ errorCode: Int, desc: String) {
        print("error code: \(errorCode)")
        print("\(desc)")
    }
    
     // KMControllerDelegate Protocol method구현
      /// 엔진 생성 및 초기화 이후, 렌더링 준비가 완료되면 아래 addViews를 호출한다.
      /// 원하는 뷰를 생성한다.
    func addViews() {
        print("addViews")
        let defaultPosition: MapPoint = MapPoint(longitude: 127.108678, latitude: 37.402001)
        let mapviewInfo = MapviewInfo(viewName: "mapview", viewInfoName: "map", defaultPosition: defaultPosition, defaultLevel: 7)
        
        controller?.addView(mapviewInfo)
//            let mapView: KakaoMap? = controller?.getView("mapview") as? KakaoMap
//            mapView?.viewRect = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: .init(width: 500, height: 500))
    }
    

    //addView 성공 이벤트 delegate. 추가적으로 수행할 작업을 진행한다.
    func addViewSucceeded(_ viewName: String, viewInfoName: String) {
        print("OK") //추가 성공. 성공시 추가적으로 수행할 작업을 진행한다.
        
        //TODO: delegate 패턴을 사용해 스타일 지정하는 건 어떨까요?
//        createLabelLayer()
//        createPois(longitude: 127.108678, latitude: 37.402001)
//        createPoiStyle()
        //TODO: width, height가 올바른 방법일까?
        containerDidResized(CGSize(width: 500, height: 500))
        drawPoi(location: viewModel.getLocation())
    }

    //addView 실패 이벤트 delegate. 실패에 대한 오류 처리를 진행한다.
    func addViewFailed(_ viewName: String, viewInfoName: String) {
        print("Failed")
    }
    
    /// KMViewContainer 리사이징 될 때 호출.
    func containerDidResized(_ size: CGSize) {
        print("리사이징 호출")
        let mapView: KakaoMap? = controller?.getView("mapview") as? KakaoMap
        mapView?.viewRect = CGRect(origin: .zero, size: size)
    }
    
}

extension KakaoMapCoordinator {
    // Poi생성을 위한 LabelLayer 생성
       private func createLabelLayer() {
           let msg = controller?.getStateDescMessage()
           let view = controller?.getView("mapview") as! KakaoMap
           let manager = view.getLabelManager()
           let layerOption = LabelLayerOptions(layerID: "PoiLayer", competitionType: .none, competitionUnit: .symbolFirst, orderType: .rank, zOrder: 0)
           let _ = manager.addLabelLayer(option: layerOption)
       }
       
       // Poi 표시 스타일 생성
       private func createPoiStyle() {
           let view = controller?.getView("mapview") as! KakaoMap
           let manager = view.getLabelManager()
           
           // PoiBadge는 스타일에도 추가될 수 있다. 이렇게 추가된 Badge는 해당 스타일이 적용될 때 함께 그려진다.
           
           let noti1 = PoiBadge(badgeID: "badge1", image: UIImage(named: "noti.png"), offset: CGPoint(x: 0.9, y: 0.1), zOrder: 0)
           let iconStyle1 = PoiIconStyle(symbol: UIImage(named: "pin_green.png"), anchorPoint: CGPoint(x: 0.0, y: 0.5), badges: [noti1])
           let noti2 = PoiBadge(badgeID: "badge2", image: UIImage(named: "noti2.png"), offset: CGPoint(x: 0.9, y: 0.1), zOrder: 0)
           let iconStyle2 = PoiIconStyle(symbol: UIImage(named: "pin_red.png"), anchorPoint: CGPoint(x: 0.0, y: 0.5), badges: [noti2])
           
           // 5~11, 12~21 에 표출될 스타일을 지정한다.
           let poiStyle = PoiStyle(styleID: "PerLevelStyle", styles: [
               PerLevelPoiStyle(iconStyle: iconStyle1, level: 5),
               PerLevelPoiStyle(iconStyle: iconStyle2, level: 12)
           ])
           manager.addPoiStyle(poiStyle)
       }
       
    private func createPois(longitude: Double, latitude: Double) {
           let view = controller?.getView("mapview") as! KakaoMap
           let manager = view.getLabelManager()
           let layer = manager.getLabelLayer(layerID: "PoiLayer")
           let poiOption = PoiOptions(styleID: "PerLevelStyle")
           poiOption.rank = 0
           
           let poi1 = layer?.addPoi(option:poiOption, at: MapPoint(longitude: longitude, latitude: latitude))
           // Poi 개별 Badge추가. 즉, 아래에서 생성된 Poi는 Style에 빌트인되어있는 badge와, Poi가 개별적으로 가지고 있는 Badge를 갖게 된다.
           let badge = PoiBadge(badgeID: "noti", image: UIImage(systemName: "figure.wave")!, offset: CGPoint(x: 0, y: 0), zOrder: 1)
           poi1?.addBadge(badge)
           poi1?.show()
           poi1?.showBadge(badgeID: "noti")
       }
    
    func drawPoi(location: CLLocation?) {
        guard let location = location else { return }
        let longitude = location.coordinate.longitude
        let latitude = location.coordinate.latitude
        
        createLabelLayer()
        createPois(longitude: longitude, latitude: latitude)
        createPoiStyle()
        print("longitude",longitude)
        print(latitude)
        let mapView: KakaoMap? = controller?.getView("mapview") as? KakaoMap
        if first {
            let cameraUpdate: CameraUpdate = CameraUpdate.make(target: MapPoint(longitude: longitude, latitude: latitude), zoomLevel: 17, mapView: mapView!)
            mapView?.moveCamera(cameraUpdate)
            first = false
        }
    }
}
