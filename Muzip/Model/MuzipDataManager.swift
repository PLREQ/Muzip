//
//  Persistence.swift
//  Muzip
//
//  Created by 이주화 on 2023/05/19.
//

import CoreData
import SwiftUI

class MuzipDataManager {
    
    static let shared: MuzipDataManager = MuzipDataManager()
    
    let container: NSPersistentContainer
    var context: NSManagedObjectContext {
        return container.viewContext
    }

    private init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Muzip")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func deletePlayList(){
        
        saveContext()
    }

    // 플레이리스트에 곡들을 추가
    func addMusicToPlayList(){
        
    }
    
    // 곡 삭제
    func deleteMusic(music: NSManagedObject){
        context.delete(music)
        saveContext()
    }
    
    func saveContext(){
        if context.hasChanges{
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unsolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
