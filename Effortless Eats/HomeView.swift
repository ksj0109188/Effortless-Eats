//
//  HomeView.swift
//  Effortless Eats
//
//  Created by 김성준 on 1/1/24.
//

import SwiftUI

struct HomeView: View {
    @State private var isRecommendButtonCilcked: Bool = false
    let kaka = RandomRecommendFoodStore()
    
    var body: some View {
        VStack {
            Button {
                getFood(kaka: kaka)
                isRecommendButtonCilcked.toggle()
            } label: {
                Text("랜덤 추천받기")
            }
        }
        .alert("추첨", isPresented: $isRecommendButtonCilcked, presenting: Text("f"), actions: { T in
            HStack{
                Text("다시뽑기")
                Text("확정")
            }
        })
        
        .padding()
        
    }
    
    func getFood(kaka: RandomRecommendFoodStore) {
        kaka.음식추천받기(radius: 20000)
        
    }
}

#Preview {
    HomeView()
}
