//
//  Model.swift
//  discountMe
//
//  Created by Arik Saadi on 10/07/2021.
//

import Foundation
import UIKit
import CoreData

class Model {
    static let instance = Model()

    var deals = [Deal]()
    var users = [User]()
    var favorites = [Favorite]()
    
    private init() {}
    
    let modelFirebase = ModelFirebase()
    
    // Users
    
    func getAllUsers(callback:@escaping ([User]) -> Void) {
        modelFirebase.getAllUsers(callback: callback)
            
    }
    
    func getUserById(id: String) -> User? {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = User.fetchRequest() as NSFetchRequest<User>
        request.predicate = NSPredicate(format: "id == \(id)")
        do {
            let users = try context.fetch(request)
            if users.count > 0 {
                return users[0]
            }
        } catch {}
        return nil
    }
    
    func addUser(user: User) {
        modelFirebase.addUser(user: user)
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            try context.save()
        } catch {}
    }
    
    func deleteUser(user: User) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(user)
        do {
            try context.save()
        } catch {}
    }
    
    func editUser(user: User) {
        var i = 0
        for u in users{
            if u.id == user.id{
                users.remove(at: i)
                users.append(user)
                return
            }
            i += 1
        }
    }
    
    // Deals
    
    func getAllDeals() -> [Deal] {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            let deals =  try context.fetch(Deal.fetchRequest()) as! [Deal]
            return deals
        } catch {
            return [Deal]()
        }
    }
    
    func getDealById(id: String) -> Deal? {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = Deal.fetchRequest() as NSFetchRequest<Deal>
        request.predicate = NSPredicate(format: "id == \(id)")
        do {
            let deals = try context.fetch(request)
            if deals.count > 0 {
                return deals[0]
            }
        } catch {}
        return nil
    }
    
    func addDeal(deal: Deal) {
        modelFirebase.addDeal(deal: deal)
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            try context.save()
        } catch {
                
            }
    }
    
    func deleteDeal(deal: Deal) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(deal)
        do {
            try context.save()
        } catch {}
    }
    
    func editDeal(deal: Deal) {
        var i = 0
        for d in deals{
            if d.id == deal.id{
                deals.remove(at: i)
                deals.append(deal)
                return
            }
            i += 1
        }
    }
    
    // Favorites
    
    func getAllFavorites() -> [Favorite] {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            do {
                let favorites =  try context.fetch(Favorite.fetchRequest()) as! [Favorite]
                return favorites
            } catch {
                return [Favorite]()
            }
    }
    
    func getFavoriteById(id: String) -> Favorite? {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = Favorite.fetchRequest() as NSFetchRequest<Favorite>
        request.predicate = NSPredicate(format: "id == \(id)")
        do {
            let favorites = try context.fetch(request)
            if favorites.count > 0 {
                return favorites[0]
            }
        } catch {}
        return nil
    }
    
    func addFavorite(favorite: Favorite) {
        modelFirebase.addFavorite(favorite: favorite)
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            do {
                try context.save()
            } catch {}
    }
    
    func deleteFavorite(favorite: Favorite) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(favorite)
        do {
            try context.save()
        } catch {}
    }
}
