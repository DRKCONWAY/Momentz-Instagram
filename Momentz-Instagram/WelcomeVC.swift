//
//  WelcomeVC.swift
//  Momentz-Instagram
//
//  Created by D on 12/8/16.
//  Copyright © 2016 D Conway. All rights reserved.
//

import UIKit
import Firebase

class WelcomeVC: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // checking if user is logged in
        FIRAuth.auth()?.addStateDidChangeListener({ (auth, user) in
            // user is logged in
            if let user = user {
                self.dismiss(animated: false, completion: nil)
            }
        })

    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    
}
