//
//  HomeView.swift
//  Effortless Eats
//
//  Created by 김성준 on 1/1/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationLink("추천받기") {
            RecommendView()
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}
