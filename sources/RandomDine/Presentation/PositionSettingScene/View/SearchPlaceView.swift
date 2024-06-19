//
//  PositionSettingView.swift
//  RandomDine
//
//  Created by 김성준 on 6/16/24.
//

import SwiftUI

struct SearchPlaceView: View {
    @ObservedObject var positionSettingViewModel: PositionSettingViewModel
    @State private var title: String = ""
    @State private var selectedPosition: Document?
    
    var body: some View {
        VStack {
            //MARK: TOP
            SearchBar(text: $title) {
                positionSettingViewModel.searchPlace(title: title)
            }
            
            //MARK: Middle
            List {
                if let itmes = positionSettingViewModel.items {
                    ForEach(itmes, id: \.self) { item in
                        Button(action: {
                            selectedPosition = item
                        }, label: {
                            SearchListCellView(item: item)
                        })
                    }
                }
            }
            
        }
    }
}

#Preview {
    SearchPlaceView(positionSettingViewModel: PositionSettingViewModel(
        dependency: PositionSettingViewModel.Dependencies(
            repository: RealFoodStoreDBRepository(
                persistentStore: CoreDataStack()
            ) 
        )
    ))
}
