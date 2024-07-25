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
    @Binding var selectedPosition: Document?
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            SearchBar(text: $searchTitle) { viewModel.searchPlace(title: searchTitle) }
            List {
                if let itmes = viewModel.items {
                    ForEach(itmes, id: \.self) { item in
                        Button(action: {
                            selectedPosition = item
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

//#Preview {
//    SearchPlaceView(positionSettingViewModel: PositionSettingViewModel(
//        dependency: PositionSettingViewModel.Dependencies(
//            repository: RealFoodStoreDBRepository(
//                persistentStore: CoreDataStack()
//            ) 
//        )
//    ))
//}
