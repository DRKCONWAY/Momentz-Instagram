//
//  NewsfeedVC.swift
//  Momentz-Instagram
//
//  Created by D on 12/8/16.
//  Copyright © 2016 D Conway. All rights reserved.
//

import UIKit
import Firebase

class NewsfeedVC: UITableViewController {
    
    struct Storyboard {
        static let showWelcome = "ShowWelcomeScreen"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // check if the user is logged in or not
        FIRAuth.auth()?.addStateDidChangeListener({ (auth, user) in
            if let user = user {
                // signed in
            } else {
                // user not logged in (show welcome screen)
                self.performSegue(withIdentifier: Storyboard.showWelcome, sender: nil)
            }
        })

    }


}
