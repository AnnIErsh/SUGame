//
//  Entity+CoreDataProperties.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 09.08.2022.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var emojies: Data?

}

extension Entity : Identifiable {

}
