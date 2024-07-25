//
//  Effortless_EatsApp.swift
//  Effortless Eats
//
//  Created by 김성준 on 12/27/23.
//

import SwiftUI

@main
struct RandomDine: App {
    @State var document: Document?
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView(viewModel: HomeViewModel(dependencies:  AppDIContainer.makeHomeViewModelDependencies()))
            }
        }
    }
}

