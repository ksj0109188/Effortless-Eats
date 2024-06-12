//
//  ContentView.swift
//  Effortless Eats
//
//  Created by 김성준 on 12/27/23.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @State private var showingSetting = false
    @State private var showingSafariWebView = false
    @State private var proxy: GeometryProxy?
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                HomeHeaderView(homeViewModel: homeViewModel, proxy: proxy)
                SavedRecommendList
            }
            .toolbar(content: {
                Button(action: {
                    showingSetting = true
                }, label: {
                    Image(systemName: "gearshape")
                        .foregroundStyle(Color.white)
                        .font(.title2)
                        .bold()
                })
            })
            .sheet(isPresented: $showingSetting, content: {
                NavigationStack {
                    SettingView()
                }
            })
        }
        .background(Color.customGrayLight)
    }

    var SavedRecommendList: some View {
        List {
            Section("즐겨찾기") {
                ForEach(homeViewModel.items, id: \.self) { item in
                    HStack {
                        Button {
                            showingSafariWebView = true
                        } label: {
                            Text(item.place_name ?? "추천항목")
                                .foregroundStyle(Color.black)
                                .font(.body)
                                .lineLimit(1)
                        }
                        Spacer()
                        Image(systemName: "arrow.right.circle.fill")
                            .foregroundStyle(Color.customColorSkyLight)
                    }
                    .sheet(isPresented: $showingSafariWebView, content: {
                        SafariWebView(urlString: item.place_url ?? "https://map.kakao.com")
                    })
                }
                .onDelete(perform: deleteItems)
            }
        }
        .onAppear(perform: {
            homeViewModel.fetchFoodStore()
        })
        .lineLimit(10)
        .listStyle(.insetGrouped)
    }
    
    private func deleteItems(offsets: IndexSet) {
      withAnimation {
          homeViewModel.deleteFoodStore(offsets)
      }
    }
}

struct HomeHeaderView: View {
    let homeViewModel: HomeViewModel
    @State var proxy: GeometryProxy
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).ignoresSafeArea(edges: .top)
                .frame(width: proxy.size.width,
                       height: proxy.size.height/8)
                .foregroundStyle(Color.customColorSkyLight)
                NavigationLink {
                    RecommendView(recommendViewModel: .init(dependency: RecommendViewModel.Dependencies(repository: homeViewModel.dependency.repository)))
                } label: {
                    Text("추천받기")
                        .foregroundStyle(Color.white)
                        .font(.title)
                        .bold()
                }.buttonStyle(.bordered)
            }
    }
}
