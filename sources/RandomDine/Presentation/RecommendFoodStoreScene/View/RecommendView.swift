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
    @State private var showingSettingView: Bool = false
    @ObservedObject var recommendViewModel: RecommendViewModel
    
    let clikedButtonSubject = PassthroughSubject<Void, Never>()
    
    var recommendedStoreName: String {
        recommendViewModel.recommendedStore?.placeName ?? "추첨중"
    }
    
    var recommendedStoreUrl: String {
        recommendViewModel.recommendedStore?.placeURL ?? "http://place.map.kakao.com/8107636"
    }
    
    var body: some View {
        ZStack {
            Color.customColorSkyLight
                .ignoresSafeArea(.all)
            if recommendViewModel.isEmptyRecommendStore {
                LoadingView()
                    .onDisappear(perform: { showingResultView = true })
            } else {
                resultForm
                settingPositionButton
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
        .fullScreenCover(isPresented: $showingSettingView, content: {
            PositionSettingView(viewModel: .init(dependency: PositionSettingViewModel.Dependencies(repository: recommendViewModel.dependency.repository)))
        })
    }
    
    var resultForm: some View {
        VStack(spacing: 40) {
            Button {
                recommendViewModel.isFavorite ? recommendViewModel.cancelFavorite() : recommendViewModel.addFavorite()
            } label: {
                recommendViewModel.isFavorite ? Image(systemName: "star.fill") : Image(systemName: "star")
            }
            .font(.headline)
            .foregroundStyle(Color.yellow)
            
            Text(recommendedStoreName)
                .bold()
                .font(.largeTitle)
                .lineLimit(1)
            
            HStack {
                Spacer()
                Button {
                    showingResultView = false
                    clikedButtonSubject.send()
                } label: {
                    Text("다시 받기")
                }
                .onReceive(clikedButtonSubject.throttle(for: .seconds(1), scheduler: DispatchQueue.main, latest: true),
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
                .disabled(recommendViewModel.isEmptyRecommendStore)
                
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
    
    var settingPositionButton: some View {
        VStack {
            Button {
                showingSettingView = true
            } label: {
                Text("위치 설정")
            }
            .font(.title2)
            .buttonStyle(.borderedProminent)
        }
    }
}
