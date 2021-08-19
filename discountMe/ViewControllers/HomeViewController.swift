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
    var deal = Deal()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
        let tmpDeal = data[indexPath.row]
        cell.dealNameLabel.text = tmpDeal.headline
        cell.idLabel.text = tmpDeal.id
        cell.descriptionLabel.text = tmpDeal.dealDescription
        deal = tmpDeal
        deal.id = cell.idLabel.text
        
        return cell
    }

    @IBAction func onTapDealExpand(_ sender: Any) {
        let expandedVC = storyboard?.instantiateViewController(identifier: "expanded") as! ExpandedDealViewController
        present(expandedVC, animated: true)
        NotificationCenter.default.post(name: Notification.Name("headline"), object: Model.instance.getDealById(id: deal.id!)?.headline)
        NotificationCenter.default.post(name: Notification.Name("description"), object: Model.instance.getDealById(id: deal.id!)?.dealDescription)
    }
    
    
// RELOAD DATA
    
//    func reloadData() {
//        Model.instance.getAllDeals() { deals in
//            self.data = deals
//            self.homeFeedTableView.reloadData()
//        }
//    }
    
}
