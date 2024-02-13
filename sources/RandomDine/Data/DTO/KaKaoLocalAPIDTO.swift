//
//  FoodStore.swift
//  Effortless Eats
//
//  Created by 김성준 on 12/28/23.
//

import Foundation

struct KaKaoLocalAPIDTO: Codable {
    let documents : [Documents]?
    let meta : Meta?
    
    enum CodingKeys: String, CodingKey {
        case documents = "documents"
        case meta = "meta"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        documents = try values.decodeIfPresent([Documents].self, forKey: .documents)
        meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
    }
}

struct Documents : Codable {
    let address_name : String?
    let category_group_code : String?
    let category_group_name : String?
    let category_name : String?
    let distance : String?
    let id : String?
    let phone : String?
    let place_name : String?
    let place_url : String?
    let road_address_name : String?
    let x : String?
    let y : String?

    enum CodingKeys: String, CodingKey {

        case address_name = "address_name"
        case category_group_code = "category_group_code"
        case category_group_name = "category_group_name"
        case category_name = "category_name"
        case distance = "distance"
        case id = "id"
        case phone = "phone"
        case place_name = "place_name"
        case place_url = "place_url"
        case road_address_name = "road_address_name"
        case x = "x"
        case y = "y"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        address_name = try values.decodeIfPresent(String.self, forKey: .address_name)
        category_group_code = try values.decodeIfPresent(String.self, forKey: .category_group_code)
        category_group_name = try values.decodeIfPresent(String.self, forKey: .category_group_name)
        category_name = try values.decodeIfPresent(String.self, forKey: .category_name)
        distance = try values.decodeIfPresent(String.self, forKey: .distance)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        place_name = try values.decodeIfPresent(String.self, forKey: .place_name)
        place_url = try values.decodeIfPresent(String.self, forKey: .place_url)
        road_address_name = try values.decodeIfPresent(String.self, forKey: .road_address_name)
        x = try values.decodeIfPresent(String.self, forKey: .x)
        y = try values.decodeIfPresent(String.self, forKey: .y)
    }

}

struct Meta : Codable {
    let is_end : Bool?
    let pageable_count : Int?
    let same_name : String?
    let total_count : Int?

    enum CodingKeys: String, CodingKey {

        case is_end = "is_end"
        case pageable_count = "pageable_count"
        case same_name = "same_name"
        case total_count = "total_count"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        is_end = try values.decodeIfPresent(Bool.self, forKey: .is_end)
        pageable_count = try values.decodeIfPresent(Int.self, forKey: .pageable_count)
        same_name = try values.decodeIfPresent(String.self, forKey: .same_name)
        total_count = try values.decodeIfPresent(Int.self, forKey: .total_count)
    }

}


