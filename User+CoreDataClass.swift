//
//  User+CoreDataClass.swift
//  discountMe
//
//  Created by Arik Saadi on 29/07/2021.
//
//

import Foundation
import CoreData
import UIKit

@objc(User)
public class User: NSManagedObject {
    
    static func create(id: String, firstName: String, lastName: String, email: String, password: String, imageUrl: String) -> User {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let user = User(context: context)
        user.id = id
        user.firstName = firstName
        user.lastName = lastName
        user.email = email
        user.password = password
        user.imageUrl = imageUrl
        return user
    }
    
    static func create(json: [String: Any]) -> User? {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let user = User(context: context)
        user.id = json["id"] as? String
        user.firstName = json["firstName"] as? String
        user.lastName = json["lastName"] as? String
        user.email = json["email"] as? String
        user.password = json["password"] as? String
        user.imageUrl = json["imageUrl"] as? String
        return user
    }
    
    static func edit(id: String, firstName: String, lastName: String, email: String, password: String, imageUrl: String) -> User {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let user = User(context: context)
        user.id = id
        user.firstName = firstName
        user.lastName = lastName
        user.email = email
        user.password = password
        user.imageUrl = imageUrl
        return user
    }
    
    func toJson() -> [String: Any] {
        var json = [String: Any]()
        json["id"] = id!
        json["firstName"] = firstName!
        json["lastName"] = lastName!
        json["email"] = email!
        json["password"] = password!
        if let imageUrl = imageUrl {
            json["imageUrl"] = imageUrl
        } else {
            json["imageUrl"] = ""
        }
        
        return json
    }
}
