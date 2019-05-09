//
//  CustomSpinner.swift
//  Study Capture
//
//  Created by Daniel Lee on 5/6/19.
//  Copyright © 2019 DLEE. All rights reserved.
//

import UIKit

class CustomSpinner: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    let camera = UIImageView(image: UIImage(named: "canfield_01"))
    let c = UIImageView(image: UIImage(named: "canfield_02"))
    let a = UIImageView(image: UIImage(named: "canfield_03"))
    let n = UIImageView(image: UIImage(named: "canfield_04"))
    let f = UIImageView(image: UIImage(named: "canfield_05"))
    let i = UIImageView(image: UIImage(named: "canfield_06"))
    let e = UIImageView(image: UIImage(named: "canfield_07"))
    let l = UIImageView(image: UIImage(named: "canfield_08"))
    let d = UIImageView(image: UIImage(named: "canfield_09"))
    
    lazy var canfieldImages = [camera,c,a,n,f,i,e,l,d]
    var letterConstraints = [NSLayoutConstraint]()
    
    var is_animating: Bool?
    var yAxisConstant: CGFloat = 0
    
    private func setup() {
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
        self.backgroundColor = .lightGray
        
        var index = 0
        
        for eachImageView in canfieldImages {
            eachImageView.contentMode = .scaleAspectFit
            eachImageView.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(eachImageView)
            eachImageView.alpha = 0.0
            
            let constraint = eachImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: yAxisConstant)
            constraint.isActive = true
            self.letterConstraints.append(constraint)
            
            eachImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/9).isActive = true
            eachImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/9).isActive = true
            eachImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: ((self.frame.width / 9) * CGFloat(index))).isActive = true
            index += 1
        }
    }
    
    func startAnimating() {
        self.is_animating = true
        self.isHidden = false
        self.fadeInFadeOut()
        Timer.scheduledTimer(withTimeInterval: 2.5, repeats: true) { _ in self.fadeInFadeOut() }
        
    }
    
    func fadeInFadeOut() {
        var delayIncrement = 0.0
        for eachImageView in self.canfieldImages {
            UIView.animate(withDuration: 0.1, delay: delayIncrement, options: [.curveLinear], animations: {
                eachImageView.alpha = 1.0
                delayIncrement += 0.1
                
            }) { (_) in
                delayIncrement = 1.0
                
                UIView.animate(withDuration: 0.1, delay: delayIncrement, options: .curveLinear, animations: {
                    eachImageView.alpha = 0.0
                    delayIncrement += 0.1
                })
            }
        }
    }
    
    func stopAnimating() {
        self.is_animating = false
        self.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
