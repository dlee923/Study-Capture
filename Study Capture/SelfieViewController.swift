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
        self.view.backgroundColor = .white
        self.createContainerView()
        self.createUserField()
        self.createSubmitBtn()
        self.addActivitySpinner()
    }
    
}


//    var session: AVCaptureSession?
//    var previewLayer: AVCaptureVideoPreviewLayer?
//    let previewView = UIView()
//    var photo: AVCapturePhotoOutput?
//
//    private func setup() {
//
//        self.addPreviewView()
//
//        self.createCamera()
//
//        session?.startRunning()
//    }
//
//    private func addPreviewView() {
//        self.view.addSubview(self.previewView)
//        self.previewView.translatesAutoresizingMaskIntoConstraints = false
//        self.previewView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
//        self.previewView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
//        self.previewView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
//        self.previewView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
//    }
//
//    private func createCamera() {
//        guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else { return }
//        guard let captureDevice2 = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) else { return }
//        if let deviceInput = try? AVCaptureDeviceInput(device: captureDevice2) {
//            self.session = AVCaptureSession()
//            self.session?.addInput(deviceInput)
//            guard let session = self.session else { return }
//
//            self.previewLayer = AVCaptureVideoPreviewLayer(session: session)
//            self.previewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
//            self.previewLayer?.frame = self.view.bounds
//            guard let previewLayer = self.previewLayer else { return }
//
//            self.previewView.layer.addSublayer(previewLayer)
//        }
//    }
