//
//  SearchListCellView.swift
//  RandomDine
//
//  Created by 김성준 on 6/16/24.
//

import SwiftUI

struct SearchListCellView: View {
    let item: Document
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .center) {
                Image(systemName: "mappin")
                    .font(.title2)
                Text(transformDistance)
                    .font(.footnote)
                    .lineLimit(1)
                    .frame(width: 100.0, height: 20.0)
            }
            VStack(alignment: .leading) {
                HStack {
                    Text(item.placeName ?? "")
                        .font(.title2)
                    Text(item.categoryGroupName ?? "")
                        .font(.footnote)
                        .foregroundStyle(Color.secondary)
                }
                HStack {
                    Text(item.addressName ?? "")
                        .font(.footnote)
                        .foregroundStyle(Color.secondary)
                }
            }
        }
    }
    
    var transformDistance: String {
        var distance = ""
        
        if let distanceString = item.distance, let distanceMeter = Double(distanceString) {
            if distanceMeter / 1000 >= 1 {
                distance = "\(Double(distanceMeter / 1000))km"
            } else {
                distance =  "\(distanceMeter)m"
            }
        } else {
            distance = "0.0m"
        }
        
        return distance
    }
}

#Preview {
    SearchListCellView(item:
                        Document(
                            addressName: "인천 미추홀구 용현동 501",
                            categoryGroupCode: "A4", categoryGroupName: "A4",
                            categoryName: "임시",
                            distance: "1100001", id: "21231",
                            phone: "01091665478",
                            placeName: "임시지역",
                            placeURL: "임시URL",
                            roadAddressName: "임시 도로명",
                            x: "123",
                            y: "13"))
}
