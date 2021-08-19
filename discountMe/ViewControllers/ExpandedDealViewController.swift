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
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification), name:Notification.Name("headline"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification), name:Notification.Name("description"), object: nil)
    }

    @objc func didGetNotification(_ notification: Notification) {
        let headline = notification.object as! String?
        let description = notification.object as! String?
        headlineLabel.text = headline
        descriptionLabel.text = description
    }
    
    @IBAction func onTapAddToFavorites(_ sender: UIButton) {
        let icon = UIImage(named: "icons8-heart-30")
        addToFavoritesButton.setImage(icon, for: UIControl.State.normal)
        
        dismiss(animated: true, completion: nil)
    }

}
