//
//  MusicDB+CoreDataProperties.swift
//  Muzip
//
//  Created by Yeni Hwang on 2023/05/20.
//
//

import Foundation
import CoreData


extension MusicDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MusicDB> {
        return NSFetchRequest<MusicDB>(entityName: "Music")
    }

    @NSManaged public var title: String?
    @NSManaged public var artist: String?
    @NSManaged public var musicImage: Data?
    @NSManaged public var playList: PlayListDB?

}

extension MusicDB : Identifiable {

}
