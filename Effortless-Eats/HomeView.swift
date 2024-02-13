//
//  ContentView.swift
//  Effortless Eats
//
//  Created by 김성준 on 12/27/23.
//

import SwiftUI

struct HomeView: View {
    @State private var showingSetting = false
    
    var body: some View {
        GeometryReader{ proxy in
            VStack{
                HomeHeaderView(proxy: proxy)
                List {
                    Section("추천받은 리스트") {
                        Text("비어있음")
                    }
                }
                .listStyle(.insetGrouped)
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
                NavigationStack{
                    SettingView()
                }
            })
        }
        .background(Color.customGrayLight)
    }
}

struct HomeHeaderView: View {
    @State var proxy: GeometryProxy
    var body: some View {
        ZStack{
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).ignoresSafeArea(edges: .top)
                .frame(width: proxy.size.width,
                       height: proxy.size.height/8)
                .foregroundStyle(Color.customColorSkyLight)
                NavigationLink {
                    RecommendView()
                } label: {
                    Text("추천받기")
                        .foregroundStyle(Color.white)
                        .font(.title)
                        .bold()
                }.buttonStyle(.bordered)
            }
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}
