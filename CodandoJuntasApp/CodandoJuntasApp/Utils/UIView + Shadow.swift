//
//  UIView + Shadow.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 24/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func dropShadow(scale: Bool = true) {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 1
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func addShadow(offSetX x:CGFloat, offSetY y:CGFloat, radius rad: CGFloat, opacity opct: Float){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: x, height: y)
        self.layer.shadowRadius = rad
        self.layer.shadowOpacity = opct
        self.clipsToBounds = false
    }
    
    func addShadow(color: UIColor, offSetX x:CGFloat, offSetY y:CGFloat, radius rad: CGFloat, opacity opct: Float){
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: x, height: y)
        self.layer.shadowRadius = rad
        self.layer.shadowOpacity = opct
        self.clipsToBounds = false
    }
    
}
