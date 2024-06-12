//
//  Persistence.swift
//  Effortless-Eats
//
//  Created by 김성준 on 1/24/24.
//

import CoreData
import Combine

protocol PersistentStore {
    typealias DBOperation<Result> = (NSManagedObjectContext) throws -> Result
    func count<T>(_ fetchRequest: NSFetchRequest<T>) -> AnyPublisher<Int, Error>
    func fetch<T: NSManagedObject>(_ fetchRequest: NSFetchRequest<T>) -> AnyPublisher<[T], Error>
    func update<Result>(_ operation: @escaping DBOperation<Result>) -> AnyPublisher<Result, Error>
}

struct CoreDataStack: PersistentStore {
    private let container: NSPersistentContainer
    
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
    
    func count<T>(_ fetchRequest: NSFetchRequest<T>) -> AnyPublisher<Int, Error> {
        return Future<Int, Error> { [weak container] promise in
            let context = container?.viewContext
            do {
                let count = try context?.count(for: fetchRequest) ?? 0
                promise(.success(count))
            } catch {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func fetch<T>(_ fetchRequest: NSFetchRequest<T>) -> AnyPublisher<[T], Error> {
         Future<[T], Error> { [weak container] promise in
            guard let context = container?.viewContext else {
                promise(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "View context is nil"])))
                return
            }
            
            context.performAndWait {
                do {
                    let managedObjects = try context.fetch(fetchRequest)
                    promise(.success(managedObjects))
                } catch {
                    promise(.failure(error))
                }
            }
         }
         .eraseToAnyPublisher()
    }
    
    func update<Result>(_ operation: @escaping DBOperation<Result>) -> AnyPublisher<Result, Error> {
        Future<Result, Error> { [weak container] promise in
            guard let context = container?.viewContext else { return }
            
            context.performAndWait {
                do {
                    let result = try operation(context)
                    if context.hasChanges {
                        try context.save()
                    }
                    context.reset()
                    promise(.success(result))
                } catch {
                    context.reset()
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
