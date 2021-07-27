//
//  ExpandedDealViewController.swift
//  discountMe
//
//  Created by Arik Saadi on 25/07/2021.
//

import UIKit

class ExpandedDealViewController: UIViewController {

    @IBOutlet weak var addDealImageView: UIImageView!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addToFavoritesButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onTapAddToFavorites(_ sender: UIButton) {
        let icon = UIImage(named: "icons8-heart-30")
        sender.setImage(icon, for: UIControl.State.normal)
    }
    
}
