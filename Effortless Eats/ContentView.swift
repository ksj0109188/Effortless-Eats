//
//  ContentView.swift
//  Effortless Eats
//
//  Created by 김성준 on 12/27/23.
//

import SwiftUI

struct ContentView: View {
    let kaka = RandomRecommendFoodStore()
    
    var body: some View {
        VStack {
            Button {
                getFood(kaka: kaka)
            } label: {
                Text("랜덤 추천받기")
            }
        }
        .padding()
        
    }
}

func getFood(kaka: RandomRecommendFoodStore) {
    kaka.음식추천받기(radius: 20000)
    
}

#Preview {
    ContentView()
}
