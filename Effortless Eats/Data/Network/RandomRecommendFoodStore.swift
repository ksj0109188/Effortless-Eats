//
//  KaKaoLocal.swift
//  Effortless Eats
//
//  Created by 김성준 on 12/28/23.
//

import Foundation

protocol KaKaoRESTAPI {
    var restAPIMethod: String? { get set }
    var restAPIKey: String? { get set }
}

protocol KaKaoLocalAPI {
    var LocalAPIURL: URL? {get set}
//    func 음식추천받기(radius : Int) -> KakaoAPIStatus
}

enum KakaoAPIStatus: Error {
    case scuccess
    case overflowRadius
    case notFoundedAPIKeyandMethod
    case invalidURL
}

class RandomRecommendFoodStore: KaKaoRESTAPI, KaKaoLocalAPI {
    var restAPIMethod: String?
    var restAPIKey: String?
    var LocalAPIURL: URL?
    var selectedURL: String?
    init() {
        let mainBundle = Bundle.main
        restAPIKey = mainBundle.infoDictionary?["KAKAO_REST_API_KEY"] as? String
        restAPIMethod = mainBundle.infoDictionary?["KAKAO_RESTAPI_AUTH_MEHTOD"] as? String
        
        if let kakaoLocalAPIURL =  mainBundle.infoDictionary?["KAKAO_LOCAL_API_URL"] as? String {
            LocalAPIURL = URL(string: kakaoLocalAPIURL)
        }
    }
    
    func 음식추천받기(radius: Int) -> KakaoAPIStatus {
        guard (0...20000).contains(radius) else {
            debugPrint("radius overflow")
            return KakaoAPIStatus.overflowRadius
        }
        
        guard var url = LocalAPIURL else {
            debugPrint("Invalid URL")
            return KakaoAPIStatus.invalidURL
        }
        
        guard let restAPIMethod = restAPIMethod, let restAPIKey = restAPIKey else {
            debugPrint("Invalid API Key and Method")
            return KakaoAPIStatus.notFoundedAPIKeyandMethod
        }
        
        url.append(queryItems: [ .init(name: "category_group_code", value: KaKaoLocalAPICategory.Restaurant.rawValue), .init(name: "radius", value: "\(radius)")])
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("\(restAPIMethod) \(restAPIKey)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                do {
                    let dto = try? JSONDecoder().decode(KaKaoLocalAPIDTO.self, from: data)
                    let recommendedStore = dto?.documents?.randomElement()
                    self.selectedURL = recommendedStore?.place_url
                } catch let error {
                    print("Failed to convert data to JSON: \(error)")
                }
            }
        }
        
        task.resume()
        return KakaoAPIStatus.scuccess
    }
}
