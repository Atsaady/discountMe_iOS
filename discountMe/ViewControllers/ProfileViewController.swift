//
//  ProfileViewController.swift
//  discountMe
//
//  Created by Arik Saadi on 20/07/2021.
//

import UIKit
import FirebaseAuth
let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
let userId = Constants.uid
let user = Model.instance.getUserById(id: userId)

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
        insertData()
        canEdit(answer: false)
        // Do any additional setup after loading the view.
    }
    
    func insertData() {
        user?.id = Auth.auth().currentUser?.uid
        user?.firstName = firstNameField.text
        user?.lastName = lastNameField.text
        user?.email = emailField.text
        user?.password = passwordField.text
        passwordField.isSecureTextEntry = true
        
        firstNameField.placeholder = user?.firstName
        
    }
    
    @IBAction func onTapSaveBtn(_ sender: Any) {
        let error = validateFields()
        if error != nil {
            showError(error!)
        } else {
            
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
            firstNameField.allowsEditingTextAttributes = false
            lastNameField.allowsEditingTextAttributes = false
            emailField.allowsEditingTextAttributes = false
            passwordField.allowsEditingTextAttributes = false
        } else {
            firstNameField.allowsEditingTextAttributes = true
            lastNameField.allowsEditingTextAttributes = true
            emailField.allowsEditingTextAttributes = true
            passwordField.allowsEditingTextAttributes = true
        }
        
    }
}
