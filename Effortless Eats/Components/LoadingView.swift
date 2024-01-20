//
//  LoadingView.swift
//  Effortless Eats
//
//  Created by 김성준 on 1/16/24.
//

import SwiftUI
import Combine

struct LoadingView: View {
    @State private var subsciprionts = Set<AnyCancellable>()
    @State private var pages: Int = 0
    @State private var images = [ Image("Bun"), Image("Burger1"), Image("Burger2"), Image("Hotdog"), Image("Noodle2"), Image("Pizza")]
    
    var body: some View {
        VStack(spacing: 2) {
            images[pages]
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .animation(.spring(duration: 0.5), value: pages)
            Text("로딩중")
                .bold()
                .font(.title2)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                .foregroundStyle(Color.customGrayLight)
                .shadow(radius: 10, y: 10)
        )
        
        .onAppear(perform: {
            setTimer()
        })
    }
    
    func setTimer() {
        let queue = DispatchQueue.global()
        var counter = 0
        
        queue.schedule(
            after: queue.now,
            interval: .seconds(0.5)
        ) {
            if images.count <= counter + 1 {
                counter = 0
            } else {
                counter += 1
            }
            pages = counter
        }
        .store(in: &subsciprionts)
    }
}

#Preview {
    LoadingView()
}
