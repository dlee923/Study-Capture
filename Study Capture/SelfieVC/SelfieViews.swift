//
//  SelfieViews.swift
//  Study Capture
//
//  Created by Daniel Lee on 5/4/19.
//  Copyright © 2019 DLEE. All rights reserved.
//

import UIKit

extension SelfieViewController {
    
    internal func createContainerView() {
        self.view.addSubview(self.container)
        self.container.translatesAutoresizingMaskIntoConstraints = false
        self.container.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.container.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.container.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75).isActive = true
        self.container.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        self.container.frame = CGRect(x: 0, y: 0, width: self.view.frame.width * 0.75, height: self.view.frame.width * 0.5)
        
        self.container.backgroundColor = .white
        self.container.layer.cornerRadius = 15
        self.container.layer.masksToBounds = false
        
        self.container.layer.shadowPath = UIBezierPath(rect: self.container.bounds).cgPath
        self.container.layer.shadowColor = UIColor.black.cgColor
        self.container.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        self.container.layer.shadowOpacity = 0.8
        self.container.layer.shadowRadius = 8
    }
    
    internal func createUserField() {
        self.container.addSubview(self.userFieldTitle)
        self.userFieldTitle.translatesAutoresizingMaskIntoConstraints = false
        self.userFieldTitle.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 0).isActive = true
        self.userFieldTitle.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 0).isActive = true
        self.userFieldTitle.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -0).isActive = true
        self.userFieldTitle.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.userFieldTitle.text = " Enter Subject ID:"
        self.userFieldTitle.layer.cornerRadius = 15
        self.userFieldTitle.clipsToBounds = true
        self.userFieldTitle.backgroundColor = .white
        
        self.container.addSubview(self.userField)
        self.userField.translatesAutoresizingMaskIntoConstraints = false
        self.userField.topAnchor.constraint(equalTo: self.userFieldTitle.bottomAnchor, constant: 5).isActive = true
        self.userField.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 5).isActive = true
        self.userField.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -5).isActive = true
        self.userField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.userField.placeholder = " A-Z; 0-9 Only"
        self.userField.layer.borderColor = UIColor.black.cgColor
        self.userField.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        self.userField.layer.borderWidth = 1
        self.userField.clearButtonMode = .always
    }
    
    internal func createSubmitBtn() {
        self.container.addSubview(self.submitBtn)
        self.submitBtn.translatesAutoresizingMaskIntoConstraints = false
        self.submitBtn.bottomAnchor.constraint(equalTo: self.container.bottomAnchor, constant: -5).isActive = true
        self.submitBtn.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 5).isActive = true
        self.submitBtn.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -5).isActive = true
        self.submitBtn.topAnchor.constraint(equalTo: self.userField.bottomAnchor, constant: 10).isActive = true
        
        self.submitBtn.backgroundColor = UIColor.canfieldColor
        self.submitBtn.layer.cornerRadius = 14
        self.submitBtn.addTarget(self, action: #selector(self.captureUserText), for: .touchUpInside)
        self.submitBtn.setTitle("Submit", for: .normal)
    }
    
}
