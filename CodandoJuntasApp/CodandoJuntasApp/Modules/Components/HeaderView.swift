//
//  HeaderView.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 11/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class HeaderView: UIView {
    
    var heightConstraint: NSLayoutConstraint!
    
    let maxHeight: CGFloat = 180
    let minHeight: CGFloat = 120
    
    private var animator: UIViewPropertyAnimator?
    
    var fractionComplete: CGFloat = 0.0 {
        didSet {
            self.animator?.fractionComplete = fractionComplete
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 30, height: self.maxHeight)
    }
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32.0)
        label.textColor = UIColor(red: 229, green: 229, blue: 229)
        label.textAlignment = .left
        return label
    }()
    
    lazy var blurView: UIVisualEffectView = {
        let view = UIVisualEffectView()
       // view.contentView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        return view
    }()
    
    let infoButton: UIButton = {
        let button = UIButton(type: UIButtonType.infoLight)
        button.tintColor = .slate
        return button
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupViews()
    }
    
    func setupViews() {
        
        self.backgroundColor = .clear
        self.addSubview(blurView)
        self.addSubview(usernameLabel)
        self.addSubview(infoButton)
        
        self.usernameLabel.prepareForConstraints()
        self.blurView.prepareForConstraints()
        self.infoButton.prepareForConstraints()
        
        self.blurView.pinEdgesToSuperview()
        
        self.usernameLabel.pinLeft(25)
        self.usernameLabel.pinRight(40)
        self.usernameLabel.pinBottom()
        self.usernameLabel.pinSafeTop()
        
        self.infoButton.pinRight(16)
        self.infoButton.centerVerticallyinRelationTo(self.usernameLabel.centerYAnchor)
        
        setupAnimator()
    }
    
    private func setupAnimator() {
        
        var topPadding: CGFloat = 0.0
        
        if #available(iOS 11.0, *) {
            if let window = UIApplication.shared.delegate!.window {
                topPadding = window?.safeAreaInsets.top ?? 0.0
            }
        }
        
        self.heightConstraint = self.constraintHeight(self.maxHeight + topPadding)
        
        self.animator = UIViewPropertyAnimator(duration: 0.25, curve: .linear, animations: {
            self.heightConstraint.constant = self.minHeight + topPadding
            self.usernameLabel.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            self.blurView.effect = UIBlurEffect(style: .dark)
            self.superview?.layoutIfNeeded()
            self.layoutIfNeeded()
        })
        
        self.animator?.pausesOnCompletion = true
    }
    
}

extension Reactive where Base: HeaderView {
    
    var fractionComplete: Binder<CGFloat> {
        return Binder(self.base) { header, fractionComplete in
            header.fractionComplete = fractionComplete
        }
    }
}
