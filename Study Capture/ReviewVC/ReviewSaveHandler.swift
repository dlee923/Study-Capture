//
//  ReviewSaveHandler.swift
//  Study Capture
//
//  Created by Daniel Lee on 5/5/19.
//  Copyright © 2019 DLEE. All rights reserved.
//

import UIKit

extension ReviewViewController {
    
    @objc internal func savePhoto() {
        guard let view = self.view else { return }
        guard let imageToSave = self.burnUserID(views: [view]) else { return }
        UIImageWriteToSavedPhotosAlbum(imageToSave, nil, nil, nil)
        self.savePhotoConfirmation()
    }
    
    private func savePhotoConfirmation() {
        let confirmationAlert = UIAlertController(title: "Success", message: "Photo has been saved to your camera roll.", preferredStyle: .alert)
        let okay = UIAlertAction(title: "Okay", style: .default) { (complete) in
            self.navigationController?.popViewController(animated: true)
        }
        confirmationAlert.addAction(okay)
        self.present(confirmationAlert, animated: true, completion: nil)
    }
    
    private func burnUserID(views: [UIView]) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(UIScreen.main.bounds.size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        context?.interpolationQuality = CGInterpolationQuality.high
        
        for eachView in views {
            eachView.drawHierarchy(in: eachView.frame, afterScreenUpdates: false)
        }
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
}
