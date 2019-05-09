//
//  SelfieSpinner.swift
//  Study Capture
//
//  Created by Daniel Lee on 5/4/19.
//  Copyright © 2019 DLEE. All rights reserved.
//

import UIKit

extension SelfieViewController {
    
    internal func addActivitySpinner() {
        self.activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        self.activityIndicator?.backgroundColor = UIColor.black
        self.activityIndicator?.color = UIColor.orange
        guard let activityIndicator = self.activityIndicator else { return }
        self.activityIndicator?.hidesWhenStopped = true
        self.activityIndicator?.layer.cornerRadius = 10
        self.activityIndicator?.clipsToBounds = true
        
        self.view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        activityIndicator.widthAnchor.constraint(equalToConstant: 50).isActive = true
        activityIndicator.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    internal func startSpinner() {
//        self.activityIndicator?.isHidden = false
//        self.activityIndicator?.startAnimating()
        self.customSpinner?.startAnimating()
    }
    
    internal func stopSpinner() {
//        self.activityIndicator?.stopAnimating()
        self.customSpinner?.stopAnimating()
    }
    
    func addCustomSpinner() {
        self.customSpinner = CustomSpinner(frame: CGRect(x: 0, y: 0, width: self.view.frame.width * 0.5, height: self.view.frame.width * 0.2))
        self.customSpinner?.translatesAutoresizingMaskIntoConstraints = false
        guard let customSpinner = self.customSpinner else { return }

        self.view.addSubview(customSpinner)
        customSpinner.isHidden = true
        customSpinner.translatesAutoresizingMaskIntoConstraints = false
        customSpinner.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        customSpinner.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        customSpinner.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        customSpinner.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.2).isActive = true
    }
    
}
