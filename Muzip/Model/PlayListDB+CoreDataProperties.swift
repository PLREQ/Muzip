//
//  PlayListDB+CoreDataProperties.swift
//  Muzip
//
//  Created by Yeni Hwang on 2023/05/20.
//
//

import Foundation
import CoreData


extension PlayListDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlayListDB> {
        return NSFetchRequest<PlayListDB>(entityName: "PlayList")
    }

    @NSManaged public var title: String?
    @NSManaged public var date: Date?
    @NSManaged public var music: MusicDB?

}

extension PlayListDB {
    // TODO: PlayList 메서드 추가
}

extension PlayListDB : Identifiable {

}
