//
//  Utilities.swift
//  customauth
//
//  Created by Arik Saadi on 2021-06-21.
//

import Foundation
import UIKit
import SwiftUI

class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 38/255, green: 219/255, blue: 86/255, alpha: 1).cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
        let color = UIColor.lightText
        let placeholder = textfield.placeholder ?? "" //There should be a placeholder set in storyboard or elsewhere string or pass empty
        textfield.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 38/255, green: 219/255, blue: 86/255, alpha: 1)
        button.layer.cornerRadius = 15.0
        button.tintColor = UIColor.white
    }
    
    static func styleFilledHomeButton(_ button:UIButton) {
        button.layer.cornerRadius = 15.0
    }
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 15.0
        button.tintColor = UIColor.black
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    static func clearNavBar() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        // Sets shadow (line below the bar) to a blank image
        UINavigationBar.appearance().shadowImage = UIImage()
        // Sets the translucent background color
        UINavigationBar.appearance().backgroundColor = .clear
        // Set translucent. (Default value is already true, so this can be removed if desired.)
        UINavigationBar.appearance().isTranslucent = true
    }
    
    static func designedTabBar(_ viewForTab: UIView){
        viewForTab.layer.cornerRadius = 15.0
        viewForTab.clipsToBounds = true
    }
    
    static func clearTabBar() {
        
//        UITabBar.appearance().shadowImage = UIImage()
//        UITabBar.appearance().backgroundColor = .clear
//        UITabBar.appearance().isTranslucent = true
        
    }
    
    static func hideNavBar(navBar: UINavigationController) {
        navBar.setNavigationBarHidden(true, animated: true)
    }
    
}
