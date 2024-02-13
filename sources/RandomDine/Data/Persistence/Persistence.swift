//
//  Persistence.swift
//  Effortless-Eats
//
//  Created by 김성준 on 1/24/24.
//

import CoreData

struct PersistenceController {
    // MARK: - 1. PERSISTENT CONTROLLER
    static let shared = PersistenceController()
    
    // MARK: - 2. PERSISTENT CONTAINER
    let container: NSPersistentContainer
    
    // MARK: - 3. INITIALIZATION (load the persistent store)
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Model")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                debugPrint("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    // MARK: - 4. PREVIEW
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for i in 0..<100 {
            let newItem = RecommendedList(context: viewContext)
            newItem.date = Date()
            newItem.place_name = "성심당 본점\(i)"
            newItem.place_url = "http://place.map.kakao.com/17733090"
            newItem.isFavorite = false
            newItem.address_name = "대전 중구 대종로480번길 15"
            newItem.id = UUID().uuidString
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            debugPrint("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
}
