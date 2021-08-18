//
//  Favorite+CoreDataClass.swift
//  discountMe
//
//  Created by Arik Saadi on 29/07/2021.
//
//

import Foundation
import CoreData
import UIKit

@objc(Favorite)
public class Favorite: NSManagedObject {
    
    static func create(id: String, headline: String, dealDescriiption: String, imageUrl: String) -> Favorite {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let favorite = Favorite(context: context)
        favorite.id = id
        favorite.headline = headline
        favorite.dealDescription = dealDescriiption
        favorite.imageUrl = imageUrl
        return favorite
    }
    
    static func create(json: [String: Any]) -> Favorite? {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let favorite = Favorite(context: context)
        favorite.id = json["id"] as? String
        favorite.headline = json["headline"] as? String
        favorite.dealDescription = json["dealDescription"] as? String
        favorite.imageUrl = json["imageUrl"] as? String
        return favorite
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
