//
//  SignupVC.swift
//  Momentz-Instagram
//
//  Created by D on 12/8/16.
//  Copyright © 2016 D Conway. All rights reserved.
//

import UIKit
import Firebase

class SignupVC: UITableViewController {

    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var fullNameField: UITextField!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var imagePickerHelper: ImagePickerHelper!
    var profileImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Create New Account"

        // makes the profile image round
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2.0
        profileImageView.layer.masksToBounds = true
        
        emailTextField.delegate = self
        fullNameField.delegate = self
        userNameField.delegate = self
        passwordField.delegate = self
        
    }
    

    @IBAction func createNewAccountButtonPressed() {
        // make a new user
        // save the user data, take a photo
        // log in the user
        
        if emailTextField.text != "" && (passwordField.text?.characters.count)! > 6 && (userNameField.text?.characters.count)! > 6 && fullNameField.text != "" && profileImageView != nil {
            
            let username = userNameField.text!
            let password = passwordField.text!
            let fullName = fullNameField.text!
            let email = emailTextField.text!
            
            FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (firUser, error) in
                if error != nil {
                    // report the error
                    let alertController = UIAlertController(title: "Error", message: (error?.localizedDescription), preferredStyle: .alert)
                    
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                        print("You've pressed OK button");
                    }
                    
                    alertController.addAction(OKAction)
                    self.present(alertController, animated: true, completion:nil)
                } else if let firUser = firUser {
                    let newUser = User(uid: firUser.uid, username: username, fullName: fullName, bio: "", website: "", profileImage: self.profileImage, follows: [], followedBy: [])
                    newUser.save(completion: { (error) in
                        if error != nil {
                            // report error
                            let alertController = UIAlertController(title: "Error", message: (error?.localizedDescription), preferredStyle: .alert)
                            
                            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                                print("You've pressed OK button");
                            }
                            
                            alertController.addAction(OKAction)
                            self.present(alertController, animated: true, completion:nil)
                        } else {
                            // log in the user
                            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (firUser, error) in
                                if let error = error {
                                    // report the error
                                    let alertController = UIAlertController(title: "Error", message: (error.localizedDescription), preferredStyle: .alert)
                                    
                                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                                        print("You've pressed OK button");
                                    }
                                    
                                    alertController.addAction(OKAction)
                                    self.present(alertController, animated: true, completion:nil)
                                } else {
                                    self.dismiss(animated: true, completion: nil)
                                }
                            })
                        }
                    })
                }
            })
        }
  }
  
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func changeProfilePicTapped(_ sender: Any) {
        imagePickerHelper = ImagePickerHelper(viewController: self, completion: { (image) in
            self.profileImageView.image = image
            self.profileImage = image
        })
    }

}

extension SignupVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            fullNameField.becomeFirstResponder()
        } else if textField == fullNameField {
            userNameField.becomeFirstResponder()
        } else if textField == userNameField {
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            passwordField.resignFirstResponder()
            createNewAccountButtonPressed()
        }
        
        return true
    }
    
}









