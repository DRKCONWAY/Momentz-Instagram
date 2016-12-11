//
//  Image Picker Helper.swift
//  Momentz-Instagram
//
//  Created by D on 12/8/16.
//  Copyright © 2016 D Conway. All rights reserved.
//

import UIKit
import MobileCoreServices

typealias ImagePickerHelperCompletion = ((UIImage?) -> Void)!

class ImagePickerHelper: NSObject {
    
    // action sheet, imagePickerController
    weak var viewController: UIViewController!
    var completion: ImagePickerHelperCompletion
    
    // initialize the values above
    init(viewController: UIViewController, completion: ImagePickerHelperCompletion) {
        
        self.viewController = viewController
        self.completion = completion
        
        super.init()
        
        self.showPhotoSourceSelection()
    }
    
    func showPhotoSourceSelection() {
        
        let actionSheet = UIAlertController(title: "Pick New Photo", message: "Would you like to open photos library or use the camera?", preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            self.showImagePicker(sourceType: .camera)
            
        })
        
        let photosLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { (action) in
            self.showImagePicker(sourceType: .photoLibrary)

            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(photosLibraryAction)
        actionSheet.addAction(cancelAction)
        
        viewController.present(actionSheet, animated: true, completion: nil)
    }
    
    
    func showImagePicker(sourceType: UIImagePickerControllerSourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = sourceType
        imagePicker.mediaTypes = [kUTTypeImage as String]
        imagePicker.delegate = self
        
        viewController.present(imagePicker, animated: true, completion: nil)
        
    }


    
    
}


extension ImagePickerHelper: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    // if user cancels the camera, dismiss it
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerEditedImage] as! UIImage
        viewController.dismiss(animated: true, completion: nil)
        completion(image)
    }
    
    
    
    
}














