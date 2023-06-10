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
    let playListModelName: String = "PlayList"
    let MusicModelName: String = "Music"

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
    
    
    /// PlayList 불러오기
    func fetch() -> [NSManagedObject] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: playListModelName)
        
        let sort = NSSortDescriptor(key: "day", ascending: false)
        fetchRequest.sortDescriptors = [sort]
        
        do {
            let result = try context.fetch(fetchRequest)
            return result
        } catch {
            print("fetch fail")
            return []
        }
    }
    
    
    /// 저장된 PlayList 삭제
    func deletePlayList(){
        saveContext()
    }

    /// PlayList에 곡들을 추가
    func addMusicToPlayList(playListObject: NSManagedObject, musics: [MusicData]) -> Bool {
        for music in musics {
            let musicObject = NSEntityDescription.insertNewObject(forEntityName: MusicModelName, into: context) as! MusicDB
            musicObject.title = music.title
            musicObject.artist = music.artist
            musicObject.musicImage = music.musicImage
            
//            (playListObject as! PlayListDB).addToMusic(musicObject)
        }
        return saveContext()
    }

    
    /// 곡 삭제
    func deleteMusic(music: NSManagedObject){
        context.delete(music)
        saveContext()
    }
    
    ///
    func saveContext() -> Bool{
        if context.hasChanges{
            do {
                try context.save()
                return true
            } catch {
                let nserror = error as NSError
                fatalError("Unsolved error \(nserror), \(nserror.userInfo)")
                return false
            }
        } else {
            return false
        }
    }
}
