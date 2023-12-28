//
//  KaKaoLocal.swift
//  Effortless Eats
//
//  Created by 김성준 on 12/28/23.
//

import Foundation

class KaKaoLocal {
    private let rest_api_method: String
    private let rest_api_key: String
    
    init() {
        let bundle = Bundle.main
        rest_api_key = bundle.infoDictionary?["KAKAO_REST_API_KEY"] as? String ?? ""
        rest_api_method = bundle.infoDictionary?["KAKAO_RESTAPI_AUTH_MEHTOD"] as? String ?? ""
    }
    
    func 음식추천받기() {
        guard let url = URL(string: "https://dapi.kakao.com/v2/local/search/category.json?category_group_code=PM9&radius=20000") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("\(rest_api_method) \(rest_api_key)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        print(json)
                    }
                } catch let error {
                    print("Failed to convert data to JSON: \(error)")
                }
                
            }
        }

        task.resume()
    }
    
    
}
