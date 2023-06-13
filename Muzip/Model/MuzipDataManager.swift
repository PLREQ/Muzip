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
    
    /// Model Name
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
    
    /// 플레이리스트 저장
    func savePlayList(title: String, location: String, day: Date, latitude: Double, longtitude: Double, musics: [Music]) {
        let playListObject = NSEntityDescription.insertNewObject(forEntityName: playListModelName, into: context)
        playListObject.setValue(title, forKey: "title")
        playListObject.setValue(day, forKey: "day")
        playListObject.setValue(location, forKey: "location")
        playListObject.setValue(latitude, forKey: "latitude")
        playListObject.setValue(longtitude, forKey: "longtitude")

        let group = DispatchGroup()
        var errorOccurred = false

        for music in musics {
            if music.title != "" { // 음악 검색을 실패하면 저장되지 않는다.
                let musicObject = NSEntityDescription.insertNewObject(forEntityName: MusicModelName, into: context) as! MusicDB
                musicObject.title = music.title
                musicObject.artist = music.artist

                group.enter()
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: music.musicImageURL) {
                        if let image = UIImage(data: data) {
                            musicObject.musicImage = image.jpegData(compressionQuality: 1.0)
                        }
                    }
                    (playListObject as! PlayListDB).addMusicToPlayList(musicObject)
                    group.leave()
                }
            }
        }

        group.notify(queue: DispatchQueue.global()) {
            do {
                try self.context.save()
            } catch {
                print("failure Save")
            }
        }
    }
    
    
    /// playList 삭제
    func deletePlayList(playListObject: NSManagedObject) -> Bool {
        context.delete(playListObject)

        return saveContext()
    }

    /// platList의 제목 변경
    func updatePlayListTitle(playListObject: NSManagedObject, title: String) -> Bool {
        playListObject.setValue(title, forKey: "title")

        return saveContext()
    }

    /// playLisy에서 music들을 불러오기
    func musicsFetch(playList: PlayListDB) -> [MusicDB] {
        return playList.music?.array as! [MusicDB]
    }

    /// playList에 music들을 추가
    func addMusicsToPlayList(playListObject: NSManagedObject, musics: [MusicData]) -> Bool {
        for music in musics {
            let musicObject = NSEntityDescription.insertNewObject(forEntityName: MusicModelName, into: context) as! MusicDB
            musicObject.title = music.title
            musicObject.artist = music.artist
            musicObject.musicImage = music.musicImage
            
            (playListObject as! PlayListDB).addMusicToPlayList(musicObject)
        }
        return saveContext()
    }
    
    /// playList에서 music 삭제
    func deleteMusic(music: NSManagedObject){
        context.delete(music)
        saveContext()
    }
    
    /// playList 안에서 music의 순서를 변경
    func changeMusicOrder(playListObject: [NSManagedObject], musics: [MusicData]) -> Bool {
        for i in 0..<playListObject.count {
            playListObject[i].setValue(musics[i].title, forKey: "title")
            playListObject[i].setValue(musics[i].artist, forKey: "artist")
            playListObject[i].setValue(musics[i].musicImage, forKey: "musicImage")
        }

        return saveContext()
    }
    
    /// 상태 저장
    func saveContext() -> Bool{
        if context.hasChanges{
            do {
                try context.save()
                return true
            } catch {
                let nserror = error as NSError
                fatalError("Unsolved error \(nserror), \(nserror.userInfo)")
            }
        }
        return false
    }
}
