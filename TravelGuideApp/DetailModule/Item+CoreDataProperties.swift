//
//  Item+CoreDataProperties.swift
//  TravelGuideApp
//
//  Created by Gülzade Karataş on 11.10.2022.
//

import Foundation
import CoreData

extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var detail: String?
    @NSManaged public var itemId: UUID?
    @NSManaged public var name: String?

}

extension Item : Identifiable {

}
