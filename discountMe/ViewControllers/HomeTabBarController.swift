//
//  HomeTabBarController.swift
//  discountMe
//
//  Created by Arik Saadi on 20/07/2021.
//

import UIKit

class HomeTabBarController: UITabBarController {

    @IBOutlet weak var homeTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.clearTabBar()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    
    
}
