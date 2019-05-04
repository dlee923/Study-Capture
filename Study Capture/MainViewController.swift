//
//  ViewController.swift
//  Study Capture
//
//  Created by Daniel Lee on 5/3/19.
//  Copyright © 2019 DLEE. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setup()
    }
    
    var selfieBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .purple
        return button
    }()
    
    var selfieViewController: SelfieViewController?
    
    private func setup() {
        self.view.backgroundColor = .white
        self.addSelfieButton()
    }
    
    private func addSelfieButton() {
        self.view.addSubview(self.selfieBtn)
        self.selfieBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.selfieBtn.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.2).isActive = true
        self.selfieBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.2).isActive = true
        self.selfieBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        self.selfieBtn.addTarget(self, action: #selector(self.displaySelfieViewController), for: .touchUpInside)
    }
    
    @objc private func displaySelfieViewController() {
        self.selfieViewController = SelfieViewController()
        self.navigationController?.pushViewController(self.selfieViewController ?? SelfieViewController(), animated: true)
    }

}

