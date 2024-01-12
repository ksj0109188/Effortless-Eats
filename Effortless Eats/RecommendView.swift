//
//    RecommendView.swift
//    Effortless Eats
//
//    Created by 김성준 on 1/1/24.
//


//TODO: 내 위치중심 좌표 구하기
//TODO: 내 위치 중심 기반 설정 거리고 음식점 정보 가지고오기


import SwiftUI
import CoreLocation

struct RecommendView: View {
    @State private var isRecommendButtonCilcked: Bool = false
    @State private var showingSafariWebView: Bool = false
    @ObservedObject var recommendViewModel = RecommendViewModel()
    
    
    var recommendedStoreName: String? {
        recommendViewModel.recommendedStore?.place_name
    }
    
    var recommendedStoreUrl: String {
        recommendViewModel.recommendedStore?.place_url ?? ""
    }
    
    var body: some View {
        VStack {
            
            Text(recommendedStoreName ?? "랜덤 추천받기 버튼을 눌러주세요!")
            HStack{
                Button {
                    recommendViewModel.fetchRandomStore(radius: 200)
                } label: {
                    Text("다시 받기")
                }
                Button {
                    showingSafariWebView = true
                } label: {
                    Text("가게정보")
                }
            }
        }
        .onAppear(perform: {
            recommendViewModel.fetchRandomStore(radius: 200)
        })
        .sheet(isPresented: $showingSafariWebView, content: {
            SafariWebView(urlString: recommendedStoreUrl)
        })
        
        .padding()
    }
}

#Preview {
    RecommendView()
}
