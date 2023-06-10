//
//  PlayListDB+CoreDataProperties.swift
//  Muzip
//
//  Created by Yeni Hwang on 2023/05/20.
//
//

import Foundation
import CoreData


//extension PlayListDB {
//
//    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlayListDB> {
//        return NSFetchRequest<PlayListDB>(entityName: "PlayList")
//    }
//
//    @NSManaged public var title: String?
//    @NSManaged public var date: Date?
//    @NSManaged public var music: MusicDB?
//
//}
//
//extension PlayListDB {
//    // TODO: PlayList 메서드 추가
//}
//
//extension PlayListDB : Identifiable {
//
//}

extension PlayListDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlayListDB> {
        return NSFetchRequest<PlayListDB>(entityName: "PlayList")
    }

    @NSManaged public var title: String?
    @NSManaged public var date: Date?
    @NSManaged public var location: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longtitude: Double
    
    @NSManaged public var music: NSOrderedSet?

}

// MARK: Generated accessors for music
extension PlayListDB {

    @objc(insertObject:inMusicAtIndex:)
    @NSManaged public func insertIntoMusic(_ value: MusicDB, at idx: Int)

    @objc(removeObjectFromMusicAtIndex:)
    @NSManaged public func removeFromMusic(at idx: Int)

    @objc(insertMusic:atIndexes:)
    @NSManaged public func insertIntoMusic(_ values: [MusicDB], at indexes: NSIndexSet)

    @objc(removeMusicAtIndexes:)
    @NSManaged public func removeFromMusic(at indexes: NSIndexSet)

    @objc(replaceObjectInMusicAtIndex:withObject:)
    @NSManaged public func replaceMusic(at idx: Int, with value: MusicDB)

    @objc(replaceMusicAtIndexes:withMusic:)
    @NSManaged public func replaceMusic(at indexes: NSIndexSet, with values: [MusicDB])

    @objc(addMusicObject:)
    @NSManaged public func addMusicToPlayList(_ value: MusicDB)

    @objc(removeMusicObject:)
    @NSManaged public func removeFromMusic(_ value: MusicDB)

    @objc(addMusic:)
    @NSManaged public func addToMusic(_ values: NSOrderedSet)

    @objc(removeMusic:)
    @NSManaged public func removeFromMusic(_ values: NSOrderedSet)

}

extension PlayListDB : Identifiable {

}
