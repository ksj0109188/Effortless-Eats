//
//    RecommendView.swift
//    Effortless Eats
//
//    Created by 김성준 on 1/1/24.
//

import SwiftUI
import CoreLocation
import Combine

struct RecommendView: View {
    @AppStorage("serachDistance") var serachDistance: Double = 500.0
    
    @State private var isRecommendButtonCilcked: Bool = false
    @State private var showingSafariWebView: Bool = false
    @State private var showingResultView: Bool = false
    
    @ObservedObject var recommendViewModel = RecommendViewModel()
    let clikedButtonSubject = PassthroughSubject<Void, Never>()
    
    var recommendedStoreName: String {
        recommendViewModel.recommendedStore?.place_name ?? "추첨중"
    }
    
    var recommendedStoreUrl: String {
        recommendViewModel.recommendedStore?.place_url ?? "추첨중"
    }
    
    var body: some View {
            ZStack {
                Color.customColorSkyLight
                    .ignoresSafeArea(.all)
                // TODO: 트렌지션 다시 생각해보기
                if recommendViewModel.isEmptyRecommendStore {
                    LoadingView()
                        .onDisappear(perform: {
                            showingResultView = true
                        })
                } else {
                    VStack(spacing: 40){
                        Text(recommendedStoreName)
                            .bold()
                            .font(.largeTitle)
                        HStack{
                            Spacer()
                            Button {
                                showingResultView = false
                                clikedButtonSubject.send()
                            } label: {
                                Text("다시 받기")
                            }
                            .onReceive(clikedButtonSubject.throttle(for:.seconds(1), scheduler: DispatchQueue.main, latest: true), 
                                       perform: { recommendViewModel.fetchRandomStore(radius: Int(serachDistance)) })
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
                    .transition(.scale.animation(.interactiveSpring(duration: 1)))
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
                    withAnimation(.easeInOut(duration: 10)) {
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
