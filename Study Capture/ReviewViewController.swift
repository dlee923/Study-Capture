//
//  ReviewViewController.swift
//  Study Capture
//
//  Created by Daniel Lee on 5/4/19.
//  Copyright © 2019 DLEE. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setup()
    }
    
    let imageView = UIImageView()
    var userLabel = UILabel()
    var userLabelText: String?
    
    private func setup() {
        self.view.backgroundColor = UIColor.white
        self.addImageView()
        self.addUserTag()
        self.addSaveButton()
    }
    
    private func addSaveButton() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(self.savePhoto))
        self.navigationItem.rightBarButtonItem = saveButton
    }
    
    @objc private func savePhoto() {
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
    
    private func addImageView() {
        self.imageView.frame = self.view.frame
        self.view.addSubview(self.imageView)
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.imageView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.imageView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        
        self.imageView.contentMode = .scaleAspectFit
    }
    
    private func addUserTag() {
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        userLabel.backgroundColor = .black
        userLabel.textColor = .white
        userLabel.clipsToBounds = true
        
        if let userLabelText = self.userLabelText {
            userLabel.text = "  \(userLabelText)"
        }
        
        self.imageView.addSubview(userLabel)
        
        userLabel.bottomAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: -self.imageView.frame.width/2 + 20).isActive = true
        userLabel.trailingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: -10).isActive = true
        userLabel.widthAnchor.constraint(equalTo: self.imageView.widthAnchor, multiplier: 0.35).isActive = true
        userLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
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
