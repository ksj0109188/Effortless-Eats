//
//  FoodStore.swift
//  Effortless Eats
//
//  Created by 김성준 on 12/28/23.
//

import Foundation

struct KaKaoLocalAPIDTO: Codable {
    let documents: [Document]?
    let meta: Meta?
}

struct Document: Codable, Hashable, Identifiable {
    let uniqueId = UUID()
    let addressName: String?
    let categoryGroupCode: String?
    let categoryGroupName: String?
    let categoryName: String?
    let distance: String?
    let id: String?
    let phone: String?
    let placeName: String?
    let placeURL: String?
    let roadAddressName: String?
    let x: String?
    let y: String?

    enum CodingKeys: String, CodingKey {
        case addressName = "address_name"
        case categoryGroupCode = "category_group_code"
        case categoryGroupName = "category_group_name"
        case categoryName = "category_name"
        case distance
        case id
        case phone
        case placeName = "place_name"
        case placeURL = "place_url"
        case roadAddressName = "road_address_name"
        case x
        case y
    }
}

struct Meta: Codable {
    let isEnd: Bool?
    let pageableCount: Int?
    let sameName: SameName?
    let totalCount: Int?

    enum CodingKeys: String, CodingKey {
        case isEnd = "is_end"
        case pageableCount = "pageable_count"
        case sameName = "same_name"
        case totalCount = "total_count"
    }
}

struct SameName: Codable {
    let keyword: String?
    let region: [String]?
    let selectedRegion: String?

    enum CodingKeys: String, CodingKey {
        case keyword
        case region
        case selectedRegion = "selected_region"
    }
}
