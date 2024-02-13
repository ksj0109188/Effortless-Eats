//
//  Effortless_EatsApp.swift
//  Effortless Eats
//
//  Created by 김성준 on 12/27/23.
//

import SwiftUI

@main
struct RandomDine: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}
