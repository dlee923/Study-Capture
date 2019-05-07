//
//  SelfiePhotoHandler.swift
//  Study Capture
//
//  Created by Daniel Lee on 5/4/19.
//  Copyright © 2019 DLEE. All rights reserved.
//

import UIKit

extension SelfieViewController {
    
    internal func presentCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let camera = UIImagePickerController()
            camera.delegate = self
            camera.sourceType = .camera
            camera.cameraCaptureMode = .photo
            camera.cameraDevice = .front
            self.present(camera, animated: true, completion: nil)
        }
    }
    
    // CIUnsharpMask with an input radius of 11 and an input intensity of 0.5
    private func applyFilter(image: UIImage) -> CIImage? {
        let coreImg = CIImage(image: image)
        let filter = CIFilter(name: "CIUnsharpMask")
        // set image for filtering
        filter?.setValue(coreImg, forKey: kCIInputImageKey)
        // set filter options
        filter?.setValue(11, forKey: kCIInputRadiusKey)
        filter?.setValue(0.5, forKey: kCIInputIntensityKey)
        return filter?.outputImage
    }
    
    private func adjustPhotoOrientation(image: UIImage) -> UIImage? {
        var transform = CGAffineTransform.identity
        if image.imageOrientation == UIImage.Orientation.up || image.imageOrientation == UIImage.Orientation.upMirrored {
        } else if image.imageOrientation == UIImage.Orientation.down || image.imageOrientation == UIImage.Orientation.downMirrored {
        } else if image.imageOrientation == UIImage.Orientation.right || image.imageOrientation == UIImage.Orientation.rightMirrored {
            transform = transform.translatedBy(x: 0, y: image.size.height)
            transform = transform.rotated(by: -CGFloat.pi/2)
        } else if image.imageOrientation == UIImage.Orientation.left || image.imageOrientation == UIImage.Orientation.leftMirrored {
        }
        
        let newCGContext = CGContext(data: nil, width: Int(image.size.width), height: Int(image.size.height), bitsPerComponent: (image.cgImage?.bitsPerComponent)!, bytesPerRow: 0, space: (image.cgImage?.colorSpace)!, bitmapInfo: (image.cgImage?.bitmapInfo.rawValue)!)
        
        newCGContext?.concatenate(transform)
        
        newCGContext?.draw(image.cgImage!, in: CGRect(x: 0,y: 0,width: image.size.height, height: image.size.width))
        guard let newCGImage = newCGContext?.makeImage() else { return nil }
        return UIImage(cgImage: newCGImage)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            guard let adjustedImage = self.adjustPhotoOrientation(image: selectedImage) else { return }
            
            self.startSpinner()
            
            DispatchQueue.global().async {
                guard let filteredImg = self.applyFilter(image: adjustedImage) else { return }
                // artificial lag for filtering image
                sleep(2)
                
                DispatchQueue.main.async {
                    self.stopSpinner()
                    let image = UIImage(ciImage: filteredImg)
                    let reviewViewController = ReviewViewController()
                    if let userText = self.userText {
                        let userObj = UserObject(image: image, userID: userText)
                        reviewViewController.userObject = userObj
                    }
                    reviewViewController.selfieDelegate = self
                    self.navigationController?.pushViewController(reviewViewController, animated: true)
                }
            }
        }
    }

}
