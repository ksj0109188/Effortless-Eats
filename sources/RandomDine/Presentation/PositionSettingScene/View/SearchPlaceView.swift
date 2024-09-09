//
//  PositionSettingView.swift
//  RandomDine
//
//  Created by 김성준 on 6/16/24.
//

import SwiftUI
import CoreLocation
import Combine

struct SearchPlaceView: View {
    @ObservedObject var viewModel: PositionSettingViewModel
    @Binding var searchTitle: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            SearchBar(text: $searchTitle) { viewModel.searchPlace(title: searchTitle) }
            List {
                if let itmes = viewModel.items {
                    ForEach(itmes, id: \.uniqueId) { item in
                        Button(action: {
                            if let placeName = item.placeName {
                                searchTitle = placeName
                            }
                            viewModel.setCurrentSelect(selectedPlace: item)
                            dismiss()
                        }, label: {
                            SearchListCellView(item: item)
                        })
                        .onAppear(perform: {
                            if let items = viewModel.items,
                               let index = items.firstIndex(of: item),
                               index == items.count - 3 {
                                viewModel.loadNextPage(title: searchTitle)
                            }
                        })
                    }.id(viewModel.items)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationBackButton(color: .primary) {}
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}
