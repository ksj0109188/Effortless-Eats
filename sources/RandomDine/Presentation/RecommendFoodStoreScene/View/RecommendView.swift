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
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \RecommendedList.date, ascending: true)],
        animation: .default)
    private var items: FetchedResults<RecommendedList>
    
    @State private var isRecommendButtonCilcked: Bool = false
    @State private var showingSafariWebView: Bool = false
    @State private var showingResultView: Bool = false
    
    @StateObject var recommendViewModel = RecommendViewModel()
    
    let clikedButtonSubject = PassthroughSubject<Void, Never>()
    
    var recommendedStoreName: String {
        recommendViewModel.recommendedStore?.place_name ?? "추첨중"
    }
    
    var recommendedStoreUrl: String {
        recommendViewModel.recommendedStore?.place_url ?? "http://place.map.kakao.com/8107636"
    }
    
    var isFavorite: Bool {
        if let item = items.first(where: {$0.id == recommendViewModel.recommendedStore?.id}) {
            return item.isFavorite
        } else {
            return false
        }
    }
    
    var body: some View {
            ZStack {
                Color.customColorSkyLight
                    .ignoresSafeArea(.all)
                if recommendViewModel.isEmptyRecommendStore {
                    LoadingView() .onDisappear(perform: { showingResultView = true })
                } else {
                    resultForm
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
    
    var resultForm: some View {
        VStack(spacing: 40) {
            Button {
                isFavorite ? deleteFavortie(at: recommendViewModel.recommendedStore?.id) : addFavorite(data: recommendViewModel.recommendedStore)
            } label: {
                isFavorite ? Image(systemName: "star.fill") : Image(systemName: "star")
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
    }
}

// MARK: CoreData Functions
extension RecommendView {
    func addFavorite(data: Documents?) {
        guard let data = data, let id = data.id else {
            return
        }
        
        let newItem = RecommendedList(context: viewContext)
        newItem.id = id
        newItem.address_name = data.address_name
        newItem.date = Date()
        newItem.isFavorite = true
        newItem.place_name = data.place_name
        newItem.place_url = data.place_url
        
        do {
          try viewContext.save()
        } catch {
          let nsError = error as NSError
          debugPrint("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func deleteFavortie(at id: String?) {
        guard let id = id else {
            return
        }
        guard let item = items.first(where: {$0.id ==  id}) else {
            debugPrint("The \(id) haven't from items")
            return
        }
        
        viewContext.delete(item)
        
        do {
          try viewContext.save()
        } catch {
          let nsError = error as NSError
            debugPrint("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

#Preview {
    NavigationStack {
        RecommendView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
