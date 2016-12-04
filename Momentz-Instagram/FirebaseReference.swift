//
//  FirebaseReference.swift
//  Momentz-Instagram
//
//  Created by D on 12/4/16.
//  Copyright © 2016 D Conway. All rights reserved.
//

import Foundation
import Firebase

// make 2 enums to generate references to Firebase

enum DatabaseReference {
    
    case root
    case users(uid: String)
    case media // posts
    case chats
    case messages
    
}


















