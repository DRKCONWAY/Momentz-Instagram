//
//  AppDelegate.swift
//  Momentz-Instagram
//
//  Created by D on 12/3/16.
//  Copyright © 2016 D Conway. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FIRApp.configure()
        return true
    }

}

