//
//  HomeView.swift
//  Effortless Eats
//
//  Created by 김성준 on 1/1/24.
//

import SwiftUI

struct HomeView: View {
    @State private var showingSetting = false
    var body: some View {
        VStack{
            NavigationLink("추천받기") {
                RecommendView()
            }
        }
        .toolbar(content: {
            Button(action: {
                showingSetting = true
            }, label: {
                Image(systemName: "gearshape")
            })
        })
        .sheet(isPresented: $showingSetting, content: {
            SettingView()
        })
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}
