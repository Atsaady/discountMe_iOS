//
//  Model.swift
//  discountMe
//
//  Created by Arik Saadi on 10/07/2021.
//

import Foundation

class Model {
    static let instance = Model()
    var deals = [Deal]()
    var users = [User]()
    var favorites = [Favorite]()
    private init() {}
    
    // Users
    
    func getAllUsers() -> [User] {
        return users
    }
    
    func getUserById(id: String) -> User? {
        for user in users{
            if user.id == id{
                return user
            }
        }
        return nil
    }
    
    func addUser(user: User) {
        users.append(user)
    }
    
    func deleteUser(user: User) {
        var i = 0
        for u in users{
            if u.id == user.id{
                users.remove(at: i)
                return
            }
            i += 1
        }
    }
    
    // Deals
    
    func getAllDeals() -> [Deal] {
        return deals
    }
    
    func getDealById(id: String) -> Deal? {
        for deal in deals{
            if deal.id == id{
                return deal
            }
        }
        return nil
    }
    
    func addDeal(deal: Deal) {
        deals.append(deal)
    }
    
    func deleteDeal(deal: Deal) {
        var i = 0
        for d in deals{
            if d.id == deal.id{
                deals.remove(at: i)
                return
            }
            i += 1
        }
    }
    
    // Favorites
    
    func getAllFavorites() -> [Favorite] {
        return favorites
    }
    
    func getFavoriteById(id: String) -> Favorite? {
        for favorite in favorites{
            if favorite.id == id{
                return favorite
            }
        }
        return nil
    }
    
    func addFavorite(favorite: Favorite) {
        favorites.append(favorite)
    }
    
    func deleteFavorite(favorite: Favorite) {
        var i = 0
        for f in favorites{
            if f.id == favorite.id{
                favorites.remove(at: i)
                return
            }
            i += 1
        }
    }
}
