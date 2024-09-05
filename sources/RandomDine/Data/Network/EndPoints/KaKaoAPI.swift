//
//  API.swift
//  Effortless Eats
//
//  Created by 김성준 on 1/8/24.
//

import Foundation
import Combine
import CoreLocation

struct KaKaoAPI {
    let locationManager = LocationManager()
    private let config: AppConfiguration = AppConfiguration()
    
    /// 내주위 음식점 정보 가지고오기
    /// - Parameters:
    ///   - radius: 내 중심점 위도 경도 기준 반경 설정 파라미터(m단위).
    /// - Returns: URL session data task publihser for a given request
    func requestStores(distance radius: Int, coordinate: CLLocationCoordinate2D?) -> AnyPublisher<KaKaoLocalAPIDTO, KakaoAPIError> {
        guard (0...20000).contains(radius) else {
            return Empty<KaKaoLocalAPIDTO, KakaoAPIError>()
                .mapError { _ in KakaoAPIError.overflowRadius}
                .eraseToAnyPublisher()
        }
        
        var request = EndPoint.recommendFoodStore.request
        request.url?.append(queryItems: [ .init(name: "radius", value: "\(radius)")])
        
        if let coordinate = coordinate {
            request.url?.append(queryItems: [ .init(name: "x", value: "\(coordinate.longitude)")])
            request.url?.append(queryItems: [ .init(name: "y", value: "\(coordinate.latitude)")])
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.global())
            .tryMap { output in
                return try JSONDecoder().decode(KaKaoLocalAPIDTO.self, from: output.data)
            }
            .mapError { error -> KakaoAPIError in
                switch error {
                case is URLError:
                    return KakaoAPIError.invalidURL
                case is DecodingError:
                    return KakaoAPIError.decodeError
                default: return KakaoAPIError.invalidResponse
                }
            }
            .eraseToAnyPublisher()
    }
    
    /// 특정 위치 검색
    /// - Parameters:
    ///   - title: 검색어
    /// - Returns: URL session data task publihser for a given request
    func searchPlace(title: String) -> AnyPublisher<KaKaoLocalAPIDTO, KakaoAPIError> {
        guard !title.isEmpty else {
            return Empty<KaKaoLocalAPIDTO, KakaoAPIError>()
                .mapError { _ in KakaoAPIError.invalidQuery}
                .eraseToAnyPublisher()
        }
        
        var request = EndPoint.searchPlace.request
        request.url?.append(queryItems: [.init(name: "query", value: title)])
        
        if let coordinate = locationManager.location?.coordinate {
            request.url?.append(queryItems: [ .init(name: "x", value: "\(coordinate.longitude)")])
            request.url?.append(queryItems: [ .init(name: "y", value: "\(coordinate.latitude)")])
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.global())
            .tryMap { output in
                return try JSONDecoder().decode(KaKaoLocalAPIDTO.self, from: output.data)
            }
            .mapError { error -> KakaoAPIError in
                switch error {
                case is URLError:
                    return KakaoAPIError.invalidURL
                case is DecodingError:
                    return KakaoAPIError.decodeError
                default: return KakaoAPIError.invalidResponse
                }
            }
            .eraseToAnyPublisher()
    }
}

extension KaKaoAPI {
    enum KakaoAPIError: Error, CustomStringConvertible {
        case overflowRadius
        case invalidURL
        case invalidResponse
        case decodeError
        case invalidQuery
        
        var description: String {
            switch self {
            case .overflowRadius:
                return "radius 파라미터 값이 유효하지 않습니다. 범위는 0~200000"
            case .invalidURL:
                return "유효하지 않는 URL 발생"
                    
            case .invalidResponse:
                return "유효하지 않는 응답."
            case .decodeError:
                return "Parsing 에러 발생"
            case .invalidQuery:
                return "유효하지 않는 쿼리 파라미터"
            }
        }
    }
    //TODO: EndPoint 분리 필요
    enum EndPoint {
        case recommendFoodStore
        case searchPlace
        
        var baseURL: URL {
            URL(string: "\(AppConfiguration().apiProtocol)://\(AppConfiguration().domain)")!
        }
        
        var request: URLRequest {
            switch self {
            case .recommendFoodStore:
                let url = baseURL.appendingPathComponent("/local/search/category.json")
                var request = URLRequest(url: url)
                request.url?.append(queryItems: [ .init(name: "category_group_code", value: KaKaoLocalAPICategory.Restaurant.rawValue)])
                request.addValue("\(AppConfiguration().restAPIMethod) \(AppConfiguration().restAPIKey)", forHTTPHeaderField: "Authorization")
                request.httpMethod = "GET"
                return request
                    
            case .searchPlace:
                let url = baseURL.appendingPathComponent("/local/search/keyword.json")
                var request = URLRequest(url: url)
                    request.addValue("\(AppConfiguration().restAPIMethod) \(AppConfiguration().restAPIKey)", forHTTPHeaderField: "Authorization")
                request.httpMethod = "GET"
                
                return request
            }
        }
    }
    
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
}
