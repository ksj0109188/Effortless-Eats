//
//  AppConfiguration.swift
//  RandomDine
//
//  Created by 김성준 on 9/2/24.
//

import Foundation

final class AppConfiguration {
    lazy var apiProtocol = Bundle.main.infoDictionary?["KAKAO_API_PROTOCOL"] as? String ??  String("")
    lazy var domain = Bundle.main.infoDictionary?["KAKAO_API_DOMAIN"] as? String ??  String("")
    lazy var restAPIKey = Bundle.main.infoDictionary?["KAKAO_REST_API_KEY"] as? String ??  String("")
    lazy var restAPIMethod = Bundle.main.infoDictionary?["KAKAO_RESTAPI_AUTH_METHOD"] as? String ??  String("")
    lazy var kakaoMapAPIKey = Bundle.main.infoDictionary?["KAKAO_MAP_API_KEY"] as? String ??  String("")
}
