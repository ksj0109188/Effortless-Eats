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
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \RecommendedList.date, ascending: true)],
        animation: .default)
    private var items: FetchedResults<RecommendedList>
    
    var body: some View {
        GeometryReader{ proxy in
            VStack{
                HomeHeaderView(viewContext: viewContext, proxy: proxy)
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
                NavigationStack{
                    SettingView()
                }
            })
        }
        .background(Color.customGrayLight)
    }

    var SavedRecommendList: some View {
        List {
            Section("즐겨찾기") {
                ForEach(items, id: \.self){ item in
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
        .lineLimit(10)
        .listStyle(.insetGrouped)
    }
    
    private func deleteItems(offsets: IndexSet) {
      withAnimation {
        offsets.map { items[$0] }.forEach(viewContext.delete)
        
        do {
          try viewContext.save()
        } catch {
          let nsError = error as NSError
          fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
      }
    }
}

struct HomeHeaderView: View {
    var viewContext: NSManagedObjectContext
    @State var proxy: GeometryProxy
    var body: some View {
        ZStack{
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).ignoresSafeArea(edges: .top)
                .frame(width: proxy.size.width,
                       height: proxy.size.height/8)
                .foregroundStyle(Color.customColorSkyLight)
                NavigationLink {
                    RecommendView()
                        .environment(\.managedObjectContext, self.viewContext)
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
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
