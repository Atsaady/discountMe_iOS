//
//  ProfileViewController.swift
//  discountMe
//
//  Created by Arik Saadi on 20/07/2021.
//

import UIKit
import FirebaseAuth
let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var editBtn: UIBarButtonItem!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        canEdit(answer: false)
        
    }
    
    @IBAction func onTapSaveBtn(_ sender: Any) {
        let error = validateFields()
        if error != nil {
            showError(error!)
        } else {
            validateFields()
            let edit = User.edit(firstName: firstNameField.text!, lastName: lastNameField.text!, email: emailField.text!, password: passwordField.text!, imageUrl: "")
            print(edit)
        }
    }
    
    @IBAction func onTapEditBtn(_ sender: Any) {
        canEdit(answer: true)
        
    }
    
    
//    @IBAction func onTapAddDeal(_ sender: Any) {
//        let error = validateFields()
//        if error != nil {
//            showError(error!)
//        } else {
//            let deal = Deal.create(id: Utilities.generateId(), headline: headlineTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines), dealDescriiption: descriptionTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines), imageUrl: "")
//            Model.instance.addDeal(deal: deal)
//            headlineTextField.text = ""
//            descriptionTextField.text = ""
//        }
//    }
    
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if firstNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        lastNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            errorLabel.alpha = 1
            return "Please fill in all fields."
        }
        else { return nil }
    }
    
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func canEdit(answer: Bool){
        if answer == false{
            firstNameField.isUserInteractionEnabled = false
            lastNameField.isUserInteractionEnabled = false
            emailField.isUserInteractionEnabled = false
            passwordField.isUserInteractionEnabled = false
        } else {
            firstNameField.isUserInteractionEnabled = true
            lastNameField.isUserInteractionEnabled = true
            emailField.isUserInteractionEnabled = true
            passwordField.isUserInteractionEnabled = true
        }
        
    }
}
