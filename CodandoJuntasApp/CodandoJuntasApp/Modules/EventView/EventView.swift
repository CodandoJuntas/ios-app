//
//  EventViewView.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 10/12/18.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

/*
 Code for dependency injection:
    self.register(EventViewView.self) { resolver in
        EventViewView()
    }
 */

protocol EventViewViewDelegate: class {
    
}

class EventView: UIViewController {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventAddressLabel: UILabel!
    @IBOutlet weak var eventDescriptionLabel: UILabel!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var containerView: UIView!
    
    var viewModel: EventViewModel!
    let originFrame: CGRect
    let event: Event
    
    var openAnimator: UIViewPropertyAnimator?
    var closeAnimator: UIViewPropertyAnimator?
    
     var offset: CGFloat = 100.0
    
    weak var delegate: EventViewViewDelegate?

    init(originFrame: CGRect, event: Event) {
        self.originFrame = originFrame
        self.event = event
        super.init(nibName: String(describing: EventView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViews()
        self.setupViewModel()
        self.setupBindings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         self.containerView.frame = self.originFrame
        self.view.layoutIfNeeded()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.offset = self.view.frame.height - self.originFrame.height
        open()
    }
    
    func open() {
        self.openAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeOut, animations: {
            self.containerView.frame = self.endFrame()
            self.blurView.effect = UIBlurEffect(style: .dark)
            //self.baseView.cardView.backgroundColor = self.viewModel.backgroundColor
           // self.baseView.feelingLabel.alpha = 1.0
        })
        
        self.openAnimator?.startAnimation()
    }
    
    func endFrame() -> CGRect {
        let endHeight = self.view.bounds.height * 0.6
        return CGRect(x: 0, y: self.view.frame.midY - endHeight / 2, width: self.view.bounds.width, height: endHeight)
    }
    
}

extension EventView {
    
    func setupViewModel() {
        self.viewModel = EventViewModel(
            
        )
    }
    
    func configureViews() {
        let borderColor = UIColor(hexString: "#404142")
        cardView.layer.borderWidth = 1.0
        cardView.layer.cornerRadius = 4
        cardView.layer.borderColor = borderColor.cgColor
        cardView.addShadow(offSetX: 0, offSetY: 2, radius: 4, opacity: 0.5)
        
        setupGestureRecognizer()
    }
    
    func setupBindings() {

    }
    
    func setupGestureRecognizer() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handle(_:)))
        self.view.addGestureRecognizer(panGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        setupCloseAnimator()
        closeAnimator?.startAnimation()
    }
    
    @objc func handle(_ gesture: UIPanGestureRecognizer) {
        
        let translation = gesture.translation(in: view)
        
        switch gesture.state {
        case .began:
            setupCloseAnimator()
        case .changed:
            let fraction = abs(translation.y / self.offset)
            self.closeAnimator?.fractionComplete = fraction
        case .ended: self.closeAnimator?.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        default:
            break
        }
        
    }
    
    func setupCloseAnimator() {
        self.closeAnimator = UIViewPropertyAnimator(duration: 0.4, curve: .easeOut, animations: {
            self.containerView.frame = self.originFrame
            self.blurView.effect = nil
            //self.cardView.backgroundColor = .white
            //self.baseView.feelingLabel.alpha = 0.0
        })
        
        self.closeAnimator?.addCompletion({ _ in
            self.dismiss(animated: false, completion: nil)
        })
    }
}

