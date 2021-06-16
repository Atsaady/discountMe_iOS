//
//  ViewController.swift
//  discountMe
//
//  Created by Arik Saadi on 14/06/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appTitle: UILabel!
    @IBOutlet weak var emailTextbox: UITextField!
    @IBOutlet weak var passwordTextbox: UITextField!
    @IBOutlet var emailText: UIView!
    @IBOutlet weak var passwordText: UILabel!
    
    @IBAction func loginButton(_ sender: UIButton) {
        
    }

    @IBAction func registerButton(_ sender: Any) {
        
    }
    
    @IBAction func onTap(_ sender: Any) {
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}


