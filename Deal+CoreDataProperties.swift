//
//  Deal+CoreDataProperties.swift
//  discountMe
//
//  Created by Arik Saadi on 29/07/2021.
//
//

import Foundation
import CoreData


extension Deal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Deal> {
        return NSFetchRequest<Deal>(entityName: "Deal")
    }

    @NSManaged public var id: String?
    @NSManaged public var headline: String?
    @NSManaged public var dealDescription: String?
    @NSManaged public var imageUrl: String?

}

extension Deal : Identifiable {

}
