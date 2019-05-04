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
        
        self.view.addSubview(activityIndicator)
        self.activityIndicator?.translatesAutoresizingMaskIntoConstraints = false
        self.activityIndicator?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.activityIndicator?.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.activityIndicator?.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.activityIndicator?.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    internal func startSpinner() {
        self.activityIndicator?.isHidden = false
        self.activityIndicator?.startAnimating()
    }
    
    internal func stopSpinner() {
        self.activityIndicator?.stopAnimating()
    }
    
}
