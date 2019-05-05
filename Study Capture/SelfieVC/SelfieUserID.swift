//
//  SelfieUserID.swift
//  Study Capture
//
//  Created by Daniel Lee on 5/4/19.
//  Copyright © 2019 DLEE. All rights reserved.
//

import UIKit

extension SelfieViewController {
    
    private func changeButtonColor() {
        UIView.animate(withDuration: 0.2, animations: {
            self.submitBtn.backgroundColor = UIColor.submitColor
        }) { (complete) in
            self.presentCamera()
        }
    }
    
    @objc internal func captureUserText() {
        self.userText = self.userField.text
        if userTextIsValid() {
            self.changeButtonColor()
        }
    }
    
    private func userTextIsValid() -> Bool {
        if !self.userField.hasText {
            let invalidAlert = UIAlertController(title: "Error", message: "User ID field is blank", preferredStyle: .alert)
            let okay = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
            invalidAlert.addAction(okay)
            self.present(invalidAlert, animated: true, completion: nil)
            return false
        } else if self.userField.text?.range(of: "[^a-zA-Z0-9]", options: .regularExpression) != nil {
            let invalidAlert = UIAlertController(title: "Error", message: "User ID is not alphanumeric", preferredStyle: .alert)
            let okay = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
            invalidAlert.addAction(okay)
            self.present(invalidAlert, animated: true, completion: nil)
            return false
        } else {
            return true
        }
    }
    
}
