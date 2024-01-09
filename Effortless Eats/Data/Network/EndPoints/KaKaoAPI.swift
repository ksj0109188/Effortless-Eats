//
//  API.swift
//  Effortless Eats
//
//  Created by 김성준 on 1/8/24.
//

import Foundation
import Combine

struct KaKaoAPI {
  
  enum KaKaoLocalAPICategory: String {
    case Supermarket = "MT1"
    case ConvenienceStore = "CS2"
    case Kindergarten = "PS3"
    case School = "SC4"
    case Academy = "AC5"
    case ParkingLot = "PK6"
    case GasStation = "OL7"
    case SubwayStation = "SW8"
    case Bank = "BK9"
    case CulturalFacility = "CT1"
    case Brokerage = "AG2"
    case PublicInstitution = "PO3"
    case TouristAttraction = "AT4"
    case Accommodation = "AD5"
    case Restaurant = "FD6"
    case Cafe = "CE7"
    case Hospital = "HP8"
    case Pharmacy = "PM9"
  }
  
  enum KakaoAPIStatus: Error {
    case scuccess
    case overflowRadius
    case invalidURL
    case invalidResponse
    case decodeError
  }

  enum EndPoint {
    static let baseURL = URL(string:  Bundle.main.infoDictionary?["KAKAO_API_URL"] as? String ?? String(""))!
    static let restAPIKey = Bundle.main.infoDictionary?["KAKAO_REST_API_KEY"] as? String
    static let restAPIMethod = Bundle.main.infoDictionary?["KAKAO_RESTAPI_AUTH_MEHTOD"] as? String
    
    case kakaoLocalAPI
    
    var request: URLRequest{
      switch self {
        case .kakaoLocalAPI :
          var request = URLRequest(url: KaKaoAPI.EndPoint.baseURL)
          request.httpMethod = "GET"
          request.url?.append(queryItems: [ .init(name: "category_group_code", value: KaKaoLocalAPICategory.Restaurant.rawValue)])
          request.addValue("\(String(describing: KaKaoAPI.EndPoint.restAPIMethod)) \(String(describing: KaKaoAPI.EndPoint.restAPIKey))", forHTTPHeaderField: "Authorization")
          return request
      }
    }
  }
    
  /// 내주위 음식점 정보 가지고오기
  /// - Parameters:
  ///   - radius: 내 중심점 위도 경도 기준 반경 설정 파라미터(m단위).
  /// - Returns: URL session data task publihser for a given request
  func fetchStoreList(_ radius: Int) -> AnyPublisher<KaKaoLocalAPIDTO, KakaoAPIStatus> {
    guard (0...20000).contains(radius) else {
      debugPrint("overflow radius")
      return Empty<KaKaoLocalAPIDTO, KakaoAPIStatus>()
        .mapError { _ in KakaoAPIStatus.overflowRadius}
        .eraseToAnyPublisher()
    }
    
    var request = EndPoint.kakaoLocalAPI.request
    request.url?.append(queryItems: [ .init(name: "radius", value: "\(radius)")])
   
    
    return URLSession.shared.dataTaskPublisher(for: request)
      .receive(on: DispatchQueue.global())
      .tryMap { output in
        do {
          return try JSONDecoder().decode(KaKaoLocalAPIDTO.self, from: output.data)
        }
        catch{
          throw KakaoAPIStatus.decodeError
        }
      }
      .mapError{ error -> KakaoAPIStatus in
        print(error)
        switch error {
          case is URLError:
            return KakaoAPIStatus.invalidURL
          default: return KakaoAPIStatus.invalidResponse
        }
      }
      .eraseToAnyPublisher()
  }
}

