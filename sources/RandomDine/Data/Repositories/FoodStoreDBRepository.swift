//
//  FoodStoreDBRepository.swift
//  RandomDine
//
//  Created by 김성준 on 6/10/24.
//

import Foundation
import CoreData
import Combine

protocol FoodStoreDBRepository {
    func selectFoodStore() -> AnyPublisher<[RecommendedList], Error>
    func insertFoodStore(foodStore: Document) -> AnyPublisher<Void, Error>
    func deleteFoodStore(item: NSManagedObject) -> AnyPublisher<Void, Error>
    func cancelFavoriteFoodStore(id: String) -> AnyPublisher<Void, Error>
    func countFoodStore(id: String) -> AnyPublisher<Int, Error>
}

struct RealFoodStoreDBRepository: FoodStoreDBRepository {
    let persistentStore: PersistentStore
    
    func selectFoodStore() -> AnyPublisher<[RecommendedList], Error> {
        persistentStore.fetch(RecommendedList.foodStoreListRequest())
    }
    
    func insertFoodStore(foodStore: Document) -> AnyPublisher<Void, Error> {
        persistentStore.update { context in
            let newItem = RecommendedList(context: context)
            
            newItem.id = foodStore.id
            newItem.addressName = foodStore.addressName
            newItem.date = Date()
            newItem.isFavorite = true
            newItem.placeName = foodStore.placeName
            newItem.placeURL = foodStore.placeURL
        }
    }
    
    func deleteFoodStore(item: NSManagedObject) -> AnyPublisher<Void, Error> {
        persistentStore.update { context in
            context.delete(item)
        }
    }
    
    func cancelFavoriteFoodStore(id: String) -> AnyPublisher<Void, Error> {
        let request = RecommendedList.favoriteStoreRequest(id: id)
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        
        return persistentStore.update { context in
            do {
                try context.execute(batchDeleteRequest)
            } catch {
                context.reset()
            }
        }
    }
    
    func countFoodStore(id: String) -> AnyPublisher<Int, Error> {
        let request = RecommendedList.favoriteStoreRequest(id: id)
        
        return persistentStore.count(request)
    }
    
}

extension RecommendedList {
    static func foodStoreListRequest() -> NSFetchRequest<RecommendedList> {
        let request: NSFetchRequest<RecommendedList> = fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \RecommendedList.date, ascending: true)]
        
        return request
    }
    
    static func favoriteStoreRequest(id: String) -> NSFetchRequest<NSFetchRequestResult> {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = RecommendedList.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
        return fetchRequest
    }
}
