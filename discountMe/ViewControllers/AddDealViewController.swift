//
//  AddDealViewController.swift
//  discountMe
//
//  Created by Arik Saadi on 20/07/2021.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class AddDealViewController: UIViewController {

    @IBOutlet weak var addDealImageView: UIImageView!
    @IBOutlet weak var headlineTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var addDealButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
    }
    
    
    
    @IBAction func onTapAddDeal(_ sender: Any) {
        let deal = Deal()
        let error = validateFields()
        if error != nil {
            showError(error!)
        } else {
            deal.imageUrl = "continue"
            deal.headline = headlineTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            deal.description = descriptionTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Model.instance.addDeal(deal: deal)
            
        }
    }
    
    func setUpElements () {
        errorLabel.alpha = 0
        Utilities.styleFilledHomeButton(addDealButton)
    }
    
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if headlineTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        descriptionTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            errorLabel.alpha = 1
            return "Please fill in all fields."
        }
        else { return nil }
    }
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome(){
        
        _ = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
    }
}
