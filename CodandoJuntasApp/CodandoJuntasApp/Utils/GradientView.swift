//
//  GradientView.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 09/12/18.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var startColor :UIColor = UIColor.black {
        didSet {
            self.updateGradient()
        }
    }
    @IBInspectable var endColor :UIColor = UIColor.black.withAlphaComponent(0.0) {
        didSet {
            self.updateGradient()
        }
    }
    
    let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    fileprivate func commonInit() {
        self.layer.addSublayer(gradientLayer)
        self.backgroundColor = UIColor.clear
        updateGradient()
    }
    
    override func prepareForInterfaceBuilder() {
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
    }
    
    fileprivate func updateGradient() {
        gradientLayer.colors = [endColor.cgColor, startColor.cgColor]
    }
    
}

