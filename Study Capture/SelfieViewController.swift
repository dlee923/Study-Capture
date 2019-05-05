//
//  SelfieViewController.swift
//  Study Capture
//
//  Created by Daniel Lee on 5/3/19.
//  Copyright © 2019 DLEE. All rights reserved.
//

import UIKit
import AVFoundation

class SelfieViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setup()
    }
    
    let userFieldTitle = UILabel()
    let userField = UITextField()
    var userText: String?
    let submitBtn = UIButton()
    let container = UIView()
    
    var activityIndicator: UIActivityIndicatorView?
    
    // Use this if using UIImagePickerControllerDelegate
    private func setup() {
        self.navigationItem.title = "User Info"
        self.view.backgroundColor = .white
        self.createContainerView()
        self.createUserField()
        self.createSubmitBtn()
        self.addActivitySpinner()
    }
    
}

protocol Reset {
    func resetToOriginalState()
}

extension SelfieViewController: Reset {
    func resetToOriginalState() {
        self.userField.text = ""
        self.submitBtn.backgroundColor = UIColor.canfieldColor
    }
}
