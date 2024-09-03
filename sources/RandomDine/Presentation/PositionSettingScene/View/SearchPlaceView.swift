//
//  PositionSettingView.swift
//  RandomDine
//
//  Created by 김성준 on 6/16/24.
//

import SwiftUI
import CoreLocation

struct SearchPlaceView: View {
    @ObservedObject var viewModel: PositionSettingViewModel
    @Binding var searchTitle: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            SearchBar(text: $searchTitle) { viewModel.searchPlace(title: searchTitle) }
            List {
                if let itmes = viewModel.items {
                    ForEach(itmes, id: \.self) { item in
                        Button(action: {
                            viewModel.setCurrentSelect(selectedPlace: item)
                            dismiss()
                        }, label: {
                            SearchListCellView(item: item)
                        })
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                NavigationBackButton(color: .white) { }
            }
        }
    }
}
