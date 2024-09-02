//
//  MapView.swift
//  RandomDine
//
//  Created by 김성준 on 6/19/24.
//

import SwiftUI

struct MapView : View {
    @State var draw: Bool = false
    @Binding var selectedPlace: Document?
    var viewModel: KaKaoMapViewModel = KaKaoMapViewModel()
    
    var body: some View {
        VStack {
//            KakaoMapView(viewModel: viewModel, draw: $draw, selectedPlace: $selectedPlace)
//                .onAppear(perform: { self.draw = true })
//                .onDisappear(perform: { self.draw = false })
        }
    }
}
