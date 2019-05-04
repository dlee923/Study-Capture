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
    let submitBtn = UIButton()
    let container = UIView()
    
    // Use this if using UIImagePickerControllerDelegate
    private func setup() {
        self.view.backgroundColor = .lightGray
        self.createContainerView()
        self.createUserField()
        self.createSubmitBtn()
    }
    
    private func createContainerView() {
        self.view.addSubview(self.container)
        self.container.translatesAutoresizingMaskIntoConstraints = false
        self.container.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.container.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.container.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75).isActive = true
        self.container.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        
        self.container.backgroundColor = .green
        self.container.layer.cornerRadius = 15
        self.container.layer.masksToBounds = true
    }
    
    private func createUserField() {
        self.container.addSubview(self.userFieldTitle)
        self.userFieldTitle.translatesAutoresizingMaskIntoConstraints = false
        self.userFieldTitle.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 5).isActive = true
        self.userFieldTitle.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 5).isActive = true
        self.userFieldTitle.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -5).isActive = true
        self.userFieldTitle.heightAnchor.constraint(equalToConstant: (self.view.bounds.width * 0.5) / 4).isActive = true
        
        self.userFieldTitle.text = "Subject ID:"
        self.userFieldTitle.backgroundColor = .orange
        
        self.container.addSubview(self.userField)
        self.userField.translatesAutoresizingMaskIntoConstraints = false
        self.userField.topAnchor.constraint(equalTo: self.userFieldTitle.bottomAnchor, constant: 5).isActive = true
        self.userField.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 5).isActive = true
        self.userField.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -5).isActive = true
        self.userField.heightAnchor.constraint(equalToConstant: (self.view.bounds.width * 0.5) / 4).isActive = true
        
        self.userField.placeholder = "A-Z; 0-9 Only"
        self.userField.layer.borderColor = UIColor.black.cgColor
        self.userField.layer.borderWidth = 4
    }
    
    private func createSubmitBtn() {
        self.container.addSubview(self.submitBtn)
        self.submitBtn.translatesAutoresizingMaskIntoConstraints = false
        self.submitBtn.bottomAnchor.constraint(equalTo: self.container.bottomAnchor, constant: -5).isActive = true
        self.submitBtn.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 5).isActive = true
        self.submitBtn.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -5).isActive = true
        self.submitBtn.topAnchor.constraint(equalTo: self.userField.bottomAnchor, constant: 5).isActive = true
        
        self.submitBtn.backgroundColor = .purple
        self.submitBtn.addTarget(self, action: #selector(self.presentCamera), for: .touchUpInside)
        self.submitBtn.setTitle("Proceed to Step 2", for: .normal)
    }
    
    @objc private func presentCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let camera = UIImagePickerController()
            camera.delegate = self
            camera.sourceType = .camera
            camera.cameraCaptureMode = .photo
            camera.cameraDevice = .front
            self.present(camera, animated: true, completion: nil)
        }
    }
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
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
