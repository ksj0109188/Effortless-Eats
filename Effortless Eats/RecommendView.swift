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
    @AppStorage("serachDistance") var serachDistance: Double = 500.0
    
    @State private var isRecommendButtonCilcked: Bool = false
    @State private var showingSafariWebView: Bool = false
    @State private var showingResultView: Bool = false
    
    @ObservedObject var recommendViewModel = RecommendViewModel()
    
    var recommendedStoreName: String? {
        recommendViewModel.recommendedStore?.randomElement()?.place_name
    }
    
    var recommendedStoreUrl: String {
        recommendViewModel.recommendedStore?.randomElement()?.place_url ?? ""
    }
    
    var body: some View {
            ZStack {
                Color.customColorSkyLight
                    .ignoresSafeArea(.all)
                if recommendViewModel.isEmptyRecommendStore && !showingResultView {
                    LoadingView()
                } else {
                    VStack(spacing: 40){
                        Text(recommendedStoreName ?? "랜덤 추천받기 버튼을 눌러주세요!")
                            .bold()
                            .font(.largeTitle)
                        HStack{
                            Spacer()
                            Button {
                                recommendViewModel.fetchRandomStore(radius: Int(serachDistance))
                            } label: {
                                Text("다시 받기")
                            }
                            .font(.title2)
                            .foregroundStyle(Color.black)
                            .buttonStyle(.bordered)
                            
                            Spacer()
                            Button {
                                showingSafariWebView = true
                            } label: {
                                Text("가게정보")
                            }
                            .font(.title2)
                            .buttonStyle(.borderedProminent)
                            Spacer()
                        }
                    }
                    .padding(20)
                    .frame(width: 300, height: 300)
                            .cornerRadius(10)
                    .background(
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                            .foregroundStyle(Color.customGrayLight)
                            .shadow(radius: 10, y: 10)
                    )
                    .transition(.scale)
                }
            }
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationBackButton(color: .white) { }
                }
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: DispatchWorkItem(block: {
                    recommendViewModel.fetchRandomStore(radius: Int(serachDistance))
                    withAnimation {
                        showingResultView = true
                    }
                }))
            })
            .sheet(isPresented: $showingSafariWebView, content: {
                SafariWebView(urlString: recommendedStoreUrl)
            })
            
    }
}

#Preview {
    NavigationStack{
        RecommendView()
    }
}
