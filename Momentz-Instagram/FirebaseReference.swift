//
//  FirebaseReference.swift
//  Momentz-Instagram
//
//  Created by D on 12/4/16.
//  Copyright © 2016 D Conway. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage

// make 2 enums to generate references to Firebase

enum DatabaseReference {
    
    case root
    case users(uid: String)
    case media // posts
    case chats
    case messages
    
    // Public
    func reference() -> FIRDatabaseReference {
       return rootRef.child(path)
    }
    
    private var rootRef: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }
    
    private var path: String {
        switch self {
        case .root:
            return ""
        case .users(let uid):  // binding
            return "users/\(uid)"
        case .media:
            return "media"
        case .chats:
            return "chats"
        case .messages:
            return "messages"
            
        }
    }
    
}

enum StorageReference {
    
    case root       // storage root
    case images     // for the post
    case profileImages // for the users
    
    
    // Public
    func reference() -> FIRStorageReference {
        return baseRef.child(path)
    }
    
    private var baseRef: FIRStorageReference {
        return FIRStorage.storage().reference()
    }
    
    private var path: String {
        switch self {
        case .root:
            return ""
        case .images:
            return "images"
        case .profileImages:
            return "profileImages"
        }
    }
    
}
















