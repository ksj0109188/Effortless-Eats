//
//  RecommendView.swift
//  Effortless Eats
//
//  Created by 김성준 on 1/1/24.
//

import SwiftUI

struct RecommendView: View {
  @State private var isRecommendButtonCilcked: Bool = false
  @ObservedObject var recommendViewModel = RecommendViewModel()
  
  var body: some View {
    VStack {
      Text(recommendViewModel.recommendedStore?.place_name ?? "오류발생")
      Button {
        isRecommendButtonCilcked.toggle()
        recommendViewModel.fetchRandomStore(radius: 200)
      } label: {
        Text("랜덤 추천받기")
      }
    }
    .alert("추첨", isPresented: $isRecommendButtonCilcked, presenting: Text("f"), actions: { T in
      HStack{
        Text("다시뽑기")
        NavigationLink {
          SafariWebView(urlString: "http://place.map.kakao.com/8107636")
        } label: {
          Text("확정")
        }
      }
    })
    .padding()
  }
}

#Preview {
  RecommendView()
}
