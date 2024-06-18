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
        VStack(alignment: .leading) {
            HStack {
                Text(item.placeName ?? "")
                    .font(.title2)
                Text(item.categoryGroupName ?? "")
                    .font(.footnote)
            }
            HStack {
                Text(transformDistance)
                    .font(.title3)
                Text(item.addressName ?? "")
                    .font(.footnote)
            }
        }
    }
}

//Functions
extension SearchListCellView {
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
                            distance: "100", id: "21231",
                            phone: "01091665478",
                            placeName: "임시지역",
                            placeURL: "임시URL",
                            roadAddressName: "임시 도로명",
                            x: "123",
                            y: "13"))
}
