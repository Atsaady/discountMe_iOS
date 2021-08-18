//
//  Favorite+CoreDataProperties.swift
//  discountMe
//
//  Created by Arik Saadi on 29/07/2021.
//
//

import Foundation
import CoreData


extension Favorite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorite> {
        return NSFetchRequest<Favorite>(entityName: "Favorite")
    }

    @NSManaged public var id: String?
    @NSManaged public var headline: String?
    @NSManaged public var dealDescription: String?
    @NSManaged public var imageUrl: String?

}

extension Favorite : Identifiable {

}
