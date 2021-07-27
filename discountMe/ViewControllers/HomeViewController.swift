//
//  HomeViewController.swift
//  discountMe
//
//  Created by Arik Saadi on 20/07/2021.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var homeFeedTableView: UITableView!
    
    var data = [Deal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        data = Model.instance.getAllDeals()
        homeFeedTableView.reloadData()
    }
    

    // UITableViewDelegate protocol
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeFeedTableView.dequeueReusableCell(withIdentifier: "HomeFeedRow", for: indexPath) as! TableViewCell
        let deal = data[indexPath.row]
        cell.dealNameLabel.text = deal.headline
        cell.idLabel.text = "100" + String(indexPath.row)
        cell.descriptionLabel.text = deal.description
        
        return cell
    }
    
// RELOAD DATA
    
//    func reloadData() {
//        Model.instance.getAllDeals() { deals in
//            self.data = deals
//            self.homeFeedTableView.reloadData()
//        }
//    }
    
}
