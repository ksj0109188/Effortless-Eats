//
//  Effortless_EatsApp.swift
//  Effortless Eats
//
//  Created by 김성준 on 12/27/23.
//

import SwiftUI

@main
struct RandomDine: App {
    let recommendViewModelDependency = AppDIContainer().makeHomeViewModelDependencies()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView(homeViewModel: HomeViewModel(dependencies: recommendViewModelDependency))
            }
        }
    }
}
