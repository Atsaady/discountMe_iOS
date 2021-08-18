//
//  ModelFirebase.swift
//  discountMe
//
//  Created by Arik Saadi on 18/08/2021.
//

import Foundation
import Firebase


class ModelFirebase {
    init() {}
        // Users
        
        func getAllUsers(callback:@escaping ([User]) -> Void) {
            let db = Firestore.firestore()
            db.collection("users").getDocuments { snapshots, error in
                if let error = error {
                    print("Error reading document: \(error)")
                } else {
                    if let snapshots = snapshots {
                        var users = [User]()
                        for snapshot in snapshots.documents {
                            if let user = User.create(json: snapshot.data()) {
                                users.append(user)
                            }
                        }
                        callback(users)
                        return
                    }
                }
                callback([User]())
            }
        }
        
//        func getUserById(id: String) -> User? {
//
//        }
        
        func addUser(user: User) {
            let db = Firestore.firestore()
            db.collection("users").document(user.id!).setData(user.toJson()) {
                error in
                if let error = error {
                    print("Error writing document: \(error)")
                } else {
                    print("Document successfully written!")
                }
            }
        }
        
        func deleteUser(user: User) {
            let db = Firestore.firestore()
            db.collection("users").document(user.id!).delete()
        }
        
        func editUser(user: User) {
            let db = Firestore.firestore()
            db.collection("users").document(user.id!).setData(user.toJson())
        }
        
        // Deals
        
        func getAllDeals(callback:@escaping ([Deal]) -> Void) {
            let db = Firestore.firestore()
            db.collection("deals").getDocuments { snapshots, error in
                if let error = error {
                    print("Error reading document: \(error)")
                } else {
                    if let snapshots = snapshots {
                        var deals = [Deal]()
                        for snapshot in snapshots.documents {
                            if let deal = Deal.create(json: snapshot.data()) {
                                deals.append(deal)
                            }
                        }
                        callback(deals)
                        return
                    }
                }
                callback([Deal]())
            }
        }
        
        func getDealById(id: String) -> Deal? {
            return nil

        }
        
        func addDeal(deal: Deal) {
            let db = Firestore.firestore()
            db.collection("deals").document(deal.id!).setData(deal.toJson()) {
                error in
                if let error = error {
                    print("Error writing document: \(error)")
                } else {
                    print("Document successfully written!")
                }
            }
        }
        
        func deleteDeal(deal: Deal) {
            let db = Firestore.firestore()
            db.collection("deals").document(deal.id!).delete()
        }
        
        func editDeal(deal: Deal) {
           
        }
        
        // Favorites
        
        func getAllFavorites(callback:@escaping ([Favorite]) -> Void) {
            let db = Firestore.firestore()
            db.collection("favorites").getDocuments { snapshots, error in
                if let error = error {
                    print("Error reading document: \(error)")
                } else {
                    if let snapshots = snapshots {
                        var favorites = [Favorite]()
                        for snapshot in snapshots.documents {
                            if let favorite = Favorite.create(json: snapshot.data()) {
                                favorites.append(favorite)
                            }
                        }
                        callback(favorites)
                        return
                    }
                }
                callback([Favorite]())
            }
        }
        
        func getFavoriteById(id: String) -> Favorite? {
            return nil
        }
        
        func addFavorite(favorite: Favorite) {
            let db = Firestore.firestore()
            db.collection("favorites").document(favorite.id!).setData(favorite.toJson()) {
                error in
                if let error = error {
                    print("Error writing document: \(error)")
                } else {
                    print("Document successfully written!")
                }
            }
        }
        
        func deleteFavorite(favorite: Favorite) {
            let db = Firestore.firestore()
            db.collection("favorites").document(favorite.id!).delete()
        }

        
        
    }
