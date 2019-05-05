//
//  ReviewViews.swift
//  Study Capture
//
//  Created by Daniel Lee on 5/5/19.
//  Copyright © 2019 DLEE. All rights reserved.
//

import UIKit

extension ReviewViewController {
    
    internal func addSaveButton() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(self.savePhoto))
        self.navigationItem.rightBarButtonItem = saveButton
    }
    
    internal func addImageView() {
        self.imageView.frame = self.view.frame
        self.view.addSubview(self.imageView)
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.imageView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.imageView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        
        self.imageView.contentMode = .scaleAspectFit
    }
    
    internal func addUserTag() {
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
    
}
