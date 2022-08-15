//
//  Score+CoreDataProperties.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 15.08.2022.
//
//

import Foundation
import CoreData


extension Score {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Score> {
        return NSFetchRequest<Score>(entityName: "Score")
    }

    @NSManaged public var score: Data?

}

extension Score : Identifiable {

}
