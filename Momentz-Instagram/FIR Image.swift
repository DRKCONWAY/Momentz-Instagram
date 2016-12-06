//
//  FIR Image.swift
//  Momentz-Instagram
//
//  Created by D on 12/5/16.
//  Copyright © 2016 D Conway. All rights are reserved.
//

import Foundation
import Firebase

class FIRImage {
    
    var image: UIImage
    var downloadURL: URL?
    var downloadLink: String!
    var ref: FIRStorageReference!
    
    // initialize the properties above
    init(image: UIImage) {
        self.image = image
    }
    
    
}
    
extension FIRImage {
    
    func saveProfileImage(_ userUID: String, _ completion: @escaping (Error?) -> Void) {
        
        
    }
    
}

private extension UIImage {
    
    func resized() -> UIImage {
        
        let height: CGFloat = 800.0
        let ratio = self.size.width / self.size.height
        let width = height * ratio
        let newSize = CGSize(width: width, height: height)
        let newRectangle = CGRect(x: 0, y: 0, width: width, height: height)
        
        UIGraphicsBeginImageContext(newSize)
        self.draw(in: newRectangle)
        
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resizedImage!
    }
    
}
    
    
    
    
    
    
    
    
    
    
    
    

