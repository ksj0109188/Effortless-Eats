//
//  KaKaoMapViewController.swift
//  RandomDine
//
//  Created by 김성준 on 6/28/24.
//

import UIKit
import KakaoMapsSDK
import Combine
import CoreLocation

///notes: KaKaoMap 엔진부팅, 뷰 초기화, 에러 표출 를 담당
class KaKaoMapViewController: UIViewController {
    var canDraw: Bool = false
    private let poiDelegate: KaKaoDrawUIDelegate!
    private let cameraDelegate: KaKaoMapCameraDelegate!
    private let viewModel = KaKaoMapViewModel()
    private var controller: KMController?
    private var container: KMViewContainer?
    private var isMapViewAdded = CurrentValueSubject<Bool, Never>(false)
    private var subsciprionts = Set<AnyCancellable>()
    
    init() {
        self.poiDelegate = KaKaoUIDraw()
        self.cameraDelegate = KaKaoCamera()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareEngine()
        activateEngine()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        isMapViewAdded.sink { [weak self] isAdded in
            if isAdded {
                if let self = self {
                    self.containerResize(CGSize(width: self.view.frame.width, height: self.view.frame.height))
                }
            }
        }
        .store(in: &subsciprionts)
    }
    
    private func prepareEngine() {
        let container = KMViewContainer()
        self.view = container
        self.container = container
        
        controller = KMController(viewContainer: container)
        controller?.delegate = self
        controller?.prepareEngine()
    }
    
    private func containerResize(_ size: CGSize) {
        let mapView: KakaoMap? = controller?.getView("mapview") as? KakaoMap
        mapView?.viewRect = CGRect(origin: .zero, size: size)
    }
    
    func activateEngine() {
            controller?.activateEngine()
    }
    
    func resetEngine() {
        controller?.pauseEngine()
    }
}

extension KaKaoMapViewController: MapControllerDelegate {
    func authenticationFailed(_ errorCode: Int, desc: String) {
        switch errorCode {
        case 400:
            showToast(self.view, message: KaKaoErrorTypes.apiAuthParam.description)
        case 401:
            showToast(self.view, message: KaKaoErrorTypes.apiAuthKey.description)
        case 403:
            showToast(self.view, message: KaKaoErrorTypes.apiAccessAuth.description)
        case 429:
            showToast(self.view, message: KaKaoErrorTypes.apiOverflowQuter.description)
        case 499:
            showToast(self.view, message: KaKaoErrorTypes.netowrk.description)
            // 인증 실패 delegate 호출 이후 5초뒤에 재인증 시도..
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { self.prepareEngine() }
        default:
            break
        }
    }
    
    func addViews() {
        debugPrint("addViews")
        controller?.addView(viewModel.makeMapviewInfo())
    }
    
    func addViewSucceeded(_ viewName: String, viewInfoName: String) {
        debugPrint("OK") //추가 성공. 성공시 추가적으로 수행할 작업을 진행한다.
        isMapViewAdded.send(true)
        canDraw = true
        createTouchEvent()
        viewModel.setMapView(from: controller) {
            if let location = viewModel.getLocation() {
                markPosition(location: location, isMoveCamera: true)
            }
        }
    }
    
    func addViewFailed(_ viewName: String, viewInfoName: String) {
        debugPrint("Failed")
        canDraw = false
    }
    
}

extension KaKaoMapViewController: KakaoMapEventDelegate {
    private func createTouchEvent() {
        let mapView: KakaoMap? = controller?.getView("mapview") as? KakaoMap
        mapView?.eventDelegate = self
    }
    
    func kakaoMapDidTapped(kakaoMap: KakaoMap, point: CGPoint) {
        let position = kakaoMap.getPosition(point)
        let location = viewModel.updateLocation(tapped: position)
        
        markPosition(location: location, isMoveCamera: true)
    }
}

///note: Poi그리기
extension KaKaoMapViewController {
    func markPosition(location: CLLocation, isMoveCamera: Bool = false) {
        do {
            let mapView = try viewModel.getMapview()
            
            if isMoveCamera {
                cameraDelegate.cameraMoveTo(location: location, subView: mapView)
            }
            
            poiDelegate.drawPoi(location: location, subView: mapView)
        } catch let err {
            showToast(self.view, message: err.localizedDescription)
        }
    }
}

extension KaKaoMapViewController {
    func showToast(_ view: UIView, message: String, duration: TimeInterval = 2.0) {
        let toastLabel = UILabel(frame: CGRect(x: view.frame.size.width/2 - 150, y: view.frame.size.height-100, width: 300, height: 35))
        
        toastLabel.backgroundColor = UIColor.black
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = NSTextAlignment.center
        toastLabel.font = .systemFont(ofSize: 16)
        view.addSubview(toastLabel)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds  =  true
        
        UIView.animate(withDuration: 0.4,
                       delay: duration - 0.4,
                       options: UIView.AnimationOptions.curveEaseOut,
                       animations: {
            toastLabel.alpha = 0.0
        },
                       completion: { _ in
            toastLabel.removeFromSuperview()
        })
    }
}

enum KaKaoErrorTypes: String, Error {
    ///note : API관련 오류 에러
    case apiAuthParam
    case apiAuthKey
    case apiAccessAuth
    case apiOverflowQuter
    case netowrk
    
    ///note: UI그리기 관련 에러
    case failedDrawPoi
    case notFoundedMapBase
    case notFoundedLocation
    
    var description: String {
        switch self {
        case .apiAuthParam:
            return "지도 종료(API인증 파라미터 오류)"
        case .apiAuthKey:
            return "지도 종료(API인증 키 오류)"
        case .apiAccessAuth:
            return "지도 종료(API인증 권한 오류)"
        case .apiOverflowQuter:
            return "지도 종료(API 사용쿼터 초과)"
        case .netowrk:
            return "지도 종료(네트워크 오류) 5초 후 재시도.."
        case .failedDrawPoi:
            return "지도 라벨 그리기 실패, 개발자한테 문의주세요."
        case .notFoundedMapBase:
            return "맵 정보를 가지고 올 수 없습니다. 개발자한테 문의 주세요."
        case .notFoundedLocation:
            return "위치 정보를 찾을 수 없습니다. 앱 홈화면에서 위치정보를 공유해주세요"
        }
    }
}
