//
//  MapView.swift
//  RandomDine
//
//  Created by 김성준 on 6/19/24.
//

import SwiftUI

struct MapView : View {
    @State var draw: Bool = false
   
    var body: some View {
        VStack{
            KakaoMapView(draw: $draw)
                .onAppear(perform: {self.draw = true})
                .onDisappear(perform: {self.draw = false})
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
        }
    }
}
