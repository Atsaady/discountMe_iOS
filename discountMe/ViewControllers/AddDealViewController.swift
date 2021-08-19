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
        let error = validateFields()
        if error != nil {
            showError(error!)
        } else {
            let deal = Deal.create(id: Utilities.generateId(), headline: headlineTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines), dealDescriiption: descriptionTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines), imageUrl: "")
            Model.instance.addDeal(deal: deal)
            headlineTextField.text = ""
            descriptionTextField.text = ""
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
    
}
