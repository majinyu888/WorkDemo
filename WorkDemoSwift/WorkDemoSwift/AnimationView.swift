//
//  AnimationView.swift
//  WorkDemoSwift
//
//  Created by hb on 2017/4/10.
//  Copyright © 2017年 com.bm.hb. All rights reserved.
//

import UIKit

let animationDuring: TimeInterval = 1
let lineWidth: CGFloat = 4
let loadingTintColor = UIColor.white


class AnimationView: UIView {
    
    fileprivate let cycleLayer: CAShapeLayer = CAShapeLayer()
    internal var isLoading: Bool = false
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        setupUI()
    }
}


extension AnimationView {
    fileprivate func setupUI() {
        self.backgroundColor = UIColor.purple
        cycleLayer.lineCap = kCALineCapRound
        cycleLayer.lineJoin = kCALineJoinRound
        cycleLayer.lineWidth = lineWidth
        cycleLayer.fillColor = UIColor.orange.cgColor
        cycleLayer.strokeColor = loadingTintColor.cgColor
        cycleLayer.strokeEnd = 0
        self.layer.addSublayer(cycleLayer)
    }
}

extension AnimationView {
    
    public func startLoading() {
        guard !isLoading else {
            return
        }
        isLoading = true
        self.alpha = 1
        
        let strokenEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokenEndAnimation.fromValue = 0
        strokenEndAnimation.toValue = 0.25
        strokenEndAnimation.fillMode = kCAFillModeForwards
        strokenEndAnimation.isRemovedOnCompletion = false
        strokenEndAnimation.duration = animationDuring/4
        strokenEndAnimation.repeatCount = Float.infinity
        cycleLayer.add(strokenEndAnimation, forKey: "strokenEndAnimation")
        
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0
        rotateAnimation.toValue = Double.pi * 2
        rotateAnimation.duration = animationDuring
        rotateAnimation.beginTime = CACurrentMediaTime() + strokenEndAnimation.duration
        rotateAnimation.repeatCount = Float.infinity
        cycleLayer.add(strokenEndAnimation, forKey: "rotateAnimation")
    }
    
    public func stopLoading() {
        guard isLoading else {
            return
        }
        
        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.toValue = 1
        strokeEndAnimation.fillMode = kCAFillModeForwards
        strokeEndAnimation.isRemovedOnCompletion = false
        strokeEndAnimation.duration = animationDuring * 3.0 / 4.0
        cycleLayer.add(strokeEndAnimation, forKey: "catchStrokeEndAnimation")
        
        UIView.animate(withDuration: 0.3, delay: strokeEndAnimation.duration, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.alpha = 0
        }, completion: { _ in
            self.cycleLayer.removeAllAnimations()
            self.isLoading = false
        })
    }
    
    
}
