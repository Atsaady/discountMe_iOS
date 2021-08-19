//
//  Deal+CoreDataClass.swift
//  discountMe
//
//  Created by Arik Saadi on 29/07/2021.
//
//

import Foundation
import CoreData
import UIKit

@objc(Deal)
public class Deal: NSManagedObject {
    static func create(id: String, headline: String, dealDescriiption: String, imageUrl: String) -> Deal {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let deal = Deal(context: context)
        deal.id = id
        deal.headline = headline
        deal.dealDescription = dealDescriiption
        deal.imageUrl = imageUrl
        return deal
    }
    
    static func create(json: [String: Any]) -> Deal? {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let deal = Deal(context: context)
        deal.id = json["id"] as? String
        deal.headline = json["headline"] as? String
        deal.dealDescription = json["dealDescription"] as? String
        deal.imageUrl = json["imageUrl"] as? String
        return deal
    }

    static func edit(id: String, headline: String, dealDescription: String, imageUrl: String) -> Deal {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let deal = Deal(context: context)
        deal.id = id
        deal.headline = headline
        deal.dealDescription = dealDescription
        deal.imageUrl = imageUrl
        return deal
    }
    
    
    func toJson() -> [String: Any] {
        var json = [String: Any]()
        json["id"] = id!
        json["headline"] = headline!
        json["dealDescription"] = dealDescription!
        if let imageUrl = imageUrl {
            json["imageUrl"] = imageUrl
        } else {
            json["imageUrl"] = ""
        }
        return json
    }

}
