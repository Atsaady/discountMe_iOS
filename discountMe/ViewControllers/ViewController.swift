//
//  ViewController.swift
//  discountMe
//
//  Created by Arik Saadi on 14/06/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    
    func setUpElements() {
        
        // Style the elements
        Utilities.styleFilledHomeButton(signUpButton)
        Utilities.styleFilledHomeButton(loginButton)
        
    }
    
    @IBAction func unwindToFirst(segue: UIStoryboardSegue){
        print("unwind to first segue")
    }
    
}


