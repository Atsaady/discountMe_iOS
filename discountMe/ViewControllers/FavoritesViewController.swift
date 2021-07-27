//
//  FavoritesViewController.swift
//  discountMe
//
//  Created by Arik Saadi on 20/07/2021.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var favoritesTableView: UITableView!
    
    var data = [Favorite]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        data = Model.instance.getAllFavorites()
        favoritesTableView.reloadData()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoritesTableView.dequeueReusableCell(withIdentifier: "FavoritesRow", for: indexPath) as! TableViewCell
        let favorite = data[indexPath.row]
        cell.dealNameLabel.text = favorite.headline
        cell.idLabel.text = "100" + String(indexPath.row)
        cell.descriptionLabel.text = favorite.description
        return cell
    }
    

}
