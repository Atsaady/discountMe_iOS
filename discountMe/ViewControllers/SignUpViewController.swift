//
//  SignUpViewController.swift
//  discountMe
//
//  Created by Arik Saadi on 10/07/2021.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        // Hide the error label
        errorLabel.alpha = 0
        
        // Style the elements
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledHomeButton(signUpButton)
        
    }
    // Check the fields and validate that the data is correct. If everything is correct, this method return nil. Otherwise, it returns the error message.
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)    == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        // Check if the password is secured
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number/"
        }
        
        
        return nil
    }

    @IBAction func signUpTapped(_ sender: Any) {
        
        let user = User(context: context)
        // Validate the fields
        let error = validateFields()
        if error != nil {
            // There's something wrong with the fields, show error message.
            showError(error!)
        } else {
            
            user.firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            user.lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            user.email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            user.password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: user.email!, password: user.password!) { (result, err) in
                // Check for errors
                if err != nil {
                    // There was an error creating the user
                    self.showError("Error creating user")
                } else {
                    
                    // User was created successfully, now store the first name and last name
                    user.id = result?.user.uid
                    Model.instance.addUser(user: user)
                    
                    // Transition to the home screen
                    self.transitionToHome()
                }
            }
            
        }

        
      
    }
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome(){
        
        let homeTabBarController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeTabBarController) as? HomeTabBarController
        
        view.window?.rootViewController = homeTabBarController
        view.window?.makeKeyAndVisible()
        
    }
}
